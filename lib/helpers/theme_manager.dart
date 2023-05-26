import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  void toggleTheme() {
    _darkMode = !_darkMode;
    //print(_darkMode);
    notifyListeners();
  }
}
