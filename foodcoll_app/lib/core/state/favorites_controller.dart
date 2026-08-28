import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/models/collocation_model.dart';
import '../utils/feedback_sonoro.dart';

class FavoritesController extends ChangeNotifier {
  FavoritesController._();

  static final FavoritesController instance = FavoritesController._();

  static const String _storageKey = 'favorites';

  final Map<String, CollocationModel> _favorites = {};

  Map<String, CollocationModel> get favorites => _favorites;

  bool isFavorite(String colocacao) {
    return _favorites.containsKey(colocacao);
  }

  void toggleFavorite(CollocationModel collocation) {
    if (_favorites.containsKey(collocation.colocacao)) {
      _favorites.remove(collocation.colocacao);
    } else {
      _favorites[collocation.colocacao] = collocation;
    }
    tocarFeedbackConfirmacao();
    notifyListeners();
    _salvar();
  }

  List<CollocationModel> get favoritesList => _favorites.values.toList();

  Future<void> carregar() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null || raw.isEmpty) return;

    try {
      final List<dynamic> decoded = jsonDecode(raw);
      _favorites.clear();
      for (final item in decoded) {
        final model = CollocationModel.fromJson(item as Map<String, dynamic>);
        _favorites[model.colocacao] = model;
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Erro ao carregar favoritos: $e');
    }
  }

  Future<void> _salvar() async {
    final prefs = await SharedPreferences.getInstance();
    final list = _favorites.values.map((c) => c.toJson()).toList();
    await prefs.setString(_storageKey, jsonEncode(list));
  }
}