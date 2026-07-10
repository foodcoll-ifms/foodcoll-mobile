import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends ChangeNotifier {
  static final AppController instance = AppController._();
  AppController._();

  bool _darkMode = false;
  double _fontSize = 1.0; // 1.0 = P, 1.15 = M, 1.3 = G
  bool _somAtivado = true;

  bool get darkMode => _darkMode;
  double get fontSize => _fontSize;
  bool get somAtivado => _somAtivado;

  Future<void> carregar() async {
    final prefs = await SharedPreferences.getInstance();
    _darkMode = prefs.getBool('darkMode') ?? false;
    _fontSize = prefs.getDouble('fontSize') ?? 1.0;
    _somAtivado = prefs.getBool('somAtivado') ?? true;
    notifyListeners();
  }

  Future<void> toggleDarkMode() async {
    _darkMode = !_darkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', _darkMode);
    notifyListeners();
  }

  Future<void> setFontSize(double size) async {
    _fontSize = size;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', size);
    notifyListeners();
  }

  Future<void> toggleSom() async {
    _somAtivado = !_somAtivado;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('somAtivado', _somAtivado);
    notifyListeners();
  }
}