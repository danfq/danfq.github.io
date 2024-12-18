import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:portfolio/pages/contact/contact.dart';
import 'package:portfolio/pages/portfolio.dart';
import 'package:portfolio/pages/projects/projects.dart';
import 'package:portfolio/pages/about/about.dart';
import 'package:portfolio/util/themes/themes.dart';
import 'package:toastification/toastification.dart';

void main() {
  //Ensure Widgets Binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  //Run App
  runApp(
    AdaptiveTheme(
      light: Themes.light,
      dark: Themes.dark,
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) {
        return ToastificationWrapper(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light,
            darkTheme: dark,
            initialRoute: "/",
            getPages: [
              GetPage(name: "/", page: () => const Portfolio()),
              GetPage(name: "/projects", page: () => Projects()),
              GetPage(name: "/about", page: () => const AboutMe()),
              GetPage(name: "/contact", page: () => const ContactMe()),
            ],
          ),
        );
      },
    ),
  );
}
