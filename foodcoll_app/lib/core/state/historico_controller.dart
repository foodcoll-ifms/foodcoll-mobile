import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../shared/models/collocation_model.dart';

class HistoricoController extends ChangeNotifier {
  HistoricoController._();

  static final HistoricoController instance = HistoricoController._();

  List<CollocationModel> _historico = [];

  List<CollocationModel> get historico => _historico;

  Future<void> carregar() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getStringList('historico') ?? [];
      _historico = raw
          .map((item) => CollocationModel.fromJson(jsonDecode(item)))
          .toList();
      notifyListeners();
    } catch (e) {
      debugPrint('Erro ao carregar histórico: $e');
    }
  }

  Future<void> adicionar(CollocationModel collocation) async {
    _historico.removeWhere((item) => item.colocacao == collocation.colocacao);
    _historico.insert(0, collocation);
    if (_historico.length > 10) _historico = _historico.sublist(0, 10);

    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = _historico
          .map((item) => jsonEncode({
                'colocacao': item.colocacao,
                'traducao': item.traducao,
              }))
          .toList();
      await prefs.setStringList('historico', raw);
    } catch (e) {
      debugPrint('Erro ao salvar histórico: $e');
    }
    notifyListeners();
  }

  Future<void> limpar() async {
    _historico = [];
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('historico');
    } catch (e) {
      debugPrint('Erro ao limpar histórico: $e');
    }
    notifyListeners();
  }
}