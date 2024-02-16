import 'package:flutter/material.dart';
import 'package:notes_app/models/theme.dart';
import 'package:notes_app/models/theme_database.dart';
import 'package:notes_app/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  static late final ThemeDB? theme;
  // initialize the app with theme from database
  static Future<void> initialize() async {
    theme = await ThemeDatabase.isar.themeDBs.get(0);
  }

  // Initial theme to set on app startup
  late ThemeData _themeData = theme!.isDark ? darkMode : lightMode;

  // Getter method to get the current theme data
  ThemeData get themeData => _themeData;

  // Getter method to check if current theme is in darkMode
  bool get isDarkMode => _themeData == darkMode;

  // Setter method to update theme and notify the app
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    // notify the app of theme change
    notifyListeners();
  }

  // method to toggle current theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
