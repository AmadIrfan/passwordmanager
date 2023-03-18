import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeMode _tMode = ThemeMode.system;
  ThemeMode get tMode => _tMode;

  void setTheme(themeMode) {
    _tMode = themeMode;
    notifyListeners();
  }
}
