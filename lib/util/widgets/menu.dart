import 'package:flutter/material.dart';
import 'package:portfolio/util/widgets/buttons.dart';
import 'package:portfolio/util/widgets/main.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //DanFQ
        const Text("DanFQ"),

        //Spacing
        const SizedBox(width: 10.0),

        //Projects
        Buttons.text(text: "Projects", onTap: () {}),

        //Spacing
        const SizedBox(width: 10.0),

        //About Me
        Buttons.text(text: "About Me", onTap: () {}),

        const SizedBox(width: 10.0),

        //Contacts
        Buttons.text(text: "Contacts", onTap: () {}),
      ],
    );
  }
}
