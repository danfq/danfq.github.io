import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

///Theme Controller
class ThemeController {
  ///Current Theme
  static bool current({required BuildContext context}) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  ///Set Appearance Mode
  static void setAppearance({
    required BuildContext context,
    required bool mode,
  }) {
    //Set Appearance
    mode ? _setDark(context: context) : _setLight(context: context);
  }

  ///Set Dark Mode
  static void _setDark({
    required BuildContext context,
  }) {
    AdaptiveTheme.of(context).setDark();
  }

  ///Set Light Mode
  static void _setLight({
    required BuildContext context,
  }) {
    AdaptiveTheme.of(context).setLight();
  }
}
