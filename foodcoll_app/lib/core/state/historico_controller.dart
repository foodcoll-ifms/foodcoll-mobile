import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:web/web.dart' as web;
import '../../shared/models/collocation_model.dart';

class HistoricoController extends ChangeNotifier {
  HistoricoController._();

  static final HistoricoController instance = HistoricoController._();

  List<CollocationModel> _historico = [];

  List<CollocationModel> get historico => _historico;

  Future<void> carregar() async {
    if (kIsWeb) {
      final raw = web.window.localStorage.getItem('historico');
      if (raw != null) {
        final List decoded = jsonDecode(raw);
        _historico = decoded
            .map((item) => CollocationModel.fromJson(item))
            .toList();
      }
    } else {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getStringList('historico') ?? [];
      _historico = raw
          .map((item) => CollocationModel.fromJson(jsonDecode(item)))
          .toList();
    }
    notifyListeners();
  }

  Future<void> adicionar(CollocationModel collocation) async {
    _historico.removeWhere((item) => item.colocacao == collocation.colocacao);
    _historico.insert(0, collocation);
    if (_historico.length > 10) _historico = _historico.sublist(0, 10);

    if (kIsWeb) {
      final raw = jsonEncode(_historico
          .map((item) => {'colocacao': item.colocacao, 'traducao': item.traducao})
          .toList());
      web.window.localStorage.setItem('historico', raw);
    } else {
      final prefs = await SharedPreferences.getInstance();
      final raw = _historico
          .map((item) => jsonEncode({'colocacao': item.colocacao, 'traducao': item.traducao}))
          .toList();
      await prefs.setStringList('historico', raw);
    }
    notifyListeners();
  }

  Future<void> limpar() async {
    _historico = [];
    if (kIsWeb) {
      web.window.localStorage.removeItem('historico');
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('historico');
    }
    notifyListeners();
  }
}