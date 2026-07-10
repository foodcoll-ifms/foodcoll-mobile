import 'package:flutter/material.dart';
import '../../../shared/models/collocation_model.dart';
import '../utils/feedback_sonoro.dart';

class FavoritesController extends ChangeNotifier {
  FavoritesController._();

  static final FavoritesController instance = FavoritesController._();

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
  }

  List<CollocationModel> get favoritesList => _favorites.values.toList();
}