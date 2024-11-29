import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:portfolio/pages/home/home.dart';
import 'package:portfolio/util/themes/controller.dart';
import 'package:portfolio/util/widgets/main.dart';
import 'package:portfolio/util/widgets/menu.dart';
import 'package:portfolio/pages/projects/projects.dart';
import 'package:portfolio/pages/about/about.dart';
import 'package:portfolio/pages/contact/contact.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  ///Current Nav Index
  int _navIndex = 0;

  ///Body
  Widget _body() {
    //Nav Index Switch
    switch (_navIndex) {
      //Home
      case 0:
        return const Home();

      //Projects
      case 1:
        return const Projects();

      //About Me
      case 2:
        return const AboutMe();

      //Contacts
      case 3:
        return const ContactMe();

      //Default - None
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainWidgets.appBar(
        centerTitle: false,
        allowBack: false,
        title: const Text("DanFQ"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: GestureDetector(
                onTap: () => ThemeController.setAppearance(
                  context: context,
                  mode: !ThemeController.current(context: context),
                ),
                child: ThemeController.current(context: context)
                    ? const Icon(Ionicons.moon_outline)
                    : const Icon(Ionicons.sunny_outline),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(child: _body()),
    );
  }
}
