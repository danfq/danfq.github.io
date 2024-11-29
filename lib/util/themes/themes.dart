import 'package:flutter/material.dart';

///Themes
class Themes {
  ///Light Theme
  static final lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      secondary: Color(0xFF008080),
    ),
    scaffoldBackgroundColor: const Color(0xFF0E1117),
  );

  ///Dark Theme
  static final darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      secondary: Color(0xFFE91E63),
    ),
    scaffoldBackgroundColor: const Color(0xFF181818),
  );
}
