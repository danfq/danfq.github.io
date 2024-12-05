import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/route_manager.dart';
import 'package:portfolio/util/widgets/buttons.dart';

class Menu extends StatelessWidget {
  final bool isMobile;

  const Menu({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: _menuItems(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: _menuItems(),
          );
  }

  List<Widget> _menuItems() {
    return [
      //Projects
      Buttons.elevatedIcon(
        text: "Projects",
        icon: Ionicons.ios_hammer_outline,
        onTap: () => Get.toNamed("/projects"),
      ),

      //Spacing
      SizedBox(width: isMobile ? 0 : 10.0, height: isMobile ? 10.0 : 0),

      //About Me
      Buttons.elevatedIcon(
        text: "About Me",
        icon: Ionicons.ios_person_outline,
        onTap: () => Get.toNamed("/about"),
      ),

      //Spacing
      SizedBox(width: isMobile ? 0 : 10.0, height: isMobile ? 10.0 : 0),

      //Contacts
      Buttons.elevatedIcon(
        text: "Contacts",
        icon: Ionicons.ios_mail_outline,
        onTap: () => Get.toNamed("/contact"),
      ),
    ];
  }
}
