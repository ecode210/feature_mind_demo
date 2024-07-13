import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider<ThemeViewModel>((_) => ThemeViewModel());

class ThemeViewModel extends ChangeNotifier {
  var _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  /// Toggle app's theme between light and dark mode
  void toggleTheme(BuildContext context) {
    switch (themeMode) {
      case ThemeMode.system:
        final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
        if (isDarkMode) {
          _themeMode = ThemeMode.light;
        } else {
          _themeMode = ThemeMode.dark;
        }
      case ThemeMode.light:
        _themeMode = ThemeMode.dark;
      case ThemeMode.dark:
        _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
