import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkMode = false;

  Brightness get currentTheme =>
      isDarkMode ? Brightness.dark : Brightness.light;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
