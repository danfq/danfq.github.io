import 'package:flutter/material.dart';
import 'package:portfolio/util/widgets/main.dart';
import 'package:portfolio/util/widgets/menu.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainWidgets.appBar(
        title: const Menu(),
        allowBack: false,
      ),
      body: SafeArea(child: Text("Portfolio")),
    );
  }
}
