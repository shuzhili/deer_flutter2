import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  void syncTheme() {
    notifyListeners();
  }

  getTheme({bool isDarkMode: false}) {
    return ThemeData(
        scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.white);
  }

  getThemeMode() {
    return ThemeMode.light;
  }
}
