import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///Themes
class Themes {
  ///Light Theme
  static final light = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFB4C7E7),
      secondary: Color(0xFF008080),
      surface: Color(0xFFFFFFFF),
      error: Color(0xFFDC3545),
    ),
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    dialogBackgroundColor: const Color(0xFFFFFFFF),
    cardColor: const Color(0xFFFFFFFF),
    dividerColor: const Color(0xFFE0E0E0),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    listTileTheme: const ListTileThemeData(
      tileColor: Color(0xFFF0F4F8),
      selectedTileColor: Color(0xFFE6EEF5),
    ),
  );

  ///Dark Theme
  static final dark = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFE6D7F5),
      secondary: Color(0xFFE91E63),
      surface: Color(0xFF1E1E1E),
      error: Color(0xFFFF6B6B),
    ),
    scaffoldBackgroundColor: const Color(0xFF0E1117),
    dialogBackgroundColor: const Color(0xFF1E1E1E),
    cardColor: const Color(0xFF1E1E1E),
    dividerColor: const Color(0xFF2D2D2D),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    listTileTheme: const ListTileThemeData(
      tileColor: Color(0xFF252836),
      selectedTileColor: Color(0xFF2A2D3E),
    ),
  );
}
