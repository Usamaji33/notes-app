import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/isar.dart';
import 'package:notes_app/models/theme.dart';

class ThemeDatabase extends ChangeNotifier {
  static final isar = IsarDatabase.isar;

  static bool isDark = false;

  static Future<void> initialize() async {
    ThemeDB? theme = await isar.themeDBs.where().findFirst();

    isDark = theme!.isDark;
  }

  bool get isDarkMode => isDark;

  // UPDATE
  Future<void> updateTheme() async {
    final existingTheme = await isar.themeDBs.get(0);
    existingTheme!.isDark = !existingTheme.isDark;
    isDark = existingTheme.isDark;

    await isar.writeTxn(() => isar.themeDBs.put(existingTheme));
    notifyListeners();
  }
}
