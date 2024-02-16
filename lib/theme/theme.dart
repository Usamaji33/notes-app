import 'package:flutter/material.dart';

// Theme values for lightMode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color(0xFFF5F5F5),
    primary: Color(0xFF6A7BFF),
    secondary: Color(0xFFF07067),
    tertiary: Color(0xFF30B7FF),
    onBackground: Color(0xFF13141F),
    onPrimary: Color(0xFFF5F5F5),
    onSecondary: Color(0xFFF5F5F5),
    onTertiary: Color(0xFFF5F5F5),
  ),
  fontFamily: "Monospace",
);

// Theme values for darkMode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF191835),
    primary: Color(0xFF00B365),
    secondary: Color(0xFFFF6464),
    tertiary: Color(0xFFFF9E00),
    onBackground: Color(0xFFF0F0F0),
    onPrimary: Color(0xFFF0F0F0),
    onSecondary: Color(0xFFF0F0F0),
    onTertiary: Color(0xFFF0F0F0),
  ),
  fontFamily: "Monospace",
);
