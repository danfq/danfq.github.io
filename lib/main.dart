import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:portfolio/pages/contact/contact.dart';
import 'package:portfolio/pages/portfolio.dart';
import 'package:portfolio/pages/projects/projects.dart';
import 'package:portfolio/pages/about/about.dart';
import 'package:portfolio/util/themes/themes.dart';

void main() {
  runApp(
    AdaptiveTheme(
      light: Themes.light,
      dark: Themes.dark,
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: light,
          darkTheme: dark,
          initialRoute: "/",
          getPages: [
            GetPage(name: "/", page: () => const Portfolio()),
            GetPage(name: "/projects", page: () => const Projects()),
            GetPage(name: "/about", page: () => const AboutMe()),
            GetPage(name: "/contacts", page: () => const ContactMe()),
          ],
        );
      },
    ),
  );
}
