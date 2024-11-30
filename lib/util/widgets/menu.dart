import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/route_manager.dart';
import 'package:portfolio/util/widgets/buttons.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        //Projects
        Buttons.elevatedIcon(
          text: "Projects",
          icon: Ionicons.ios_hammer_outline,
          onTap: () => Get.toNamed("/projects"),
        ),

        //Spacing
        const SizedBox(width: 10.0),

        //About Me
        Buttons.elevatedIcon(
          text: "About Me",
          icon: Ionicons.ios_person_outline,
          onTap: () => Get.toNamed("/about"),
        ),

        //Spacing
        const SizedBox(width: 10.0),

        //Contacts
        Buttons.elevatedIcon(
          text: "Contacts",
          icon: Ionicons.ios_mail_outline,
          onTap: () => Get.toNamed("/contact"),
        ),
      ],
    );
  }
}
