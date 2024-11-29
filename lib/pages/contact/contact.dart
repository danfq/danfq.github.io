import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:portfolio/pages/contact/widgets/form.dart';
import 'package:portfolio/util/widgets/buttons.dart';
import 'package:portfolio/util/widgets/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainWidgets.appBar(title: const Text("Contact Me")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Social Media Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //GitHub
                Buttons.iconFilled(
                  icon: Feather.github,
                  onTap: _launchGitHub,
                  tooltip: "GitHub",
                ),

                //Spacing
                const SizedBox(width: 20),

                //BlueSky
                Buttons.iconFilled(
                  icon: Ionicons.ios_cloud_outline,
                  onTap: _launchBlueSky,
                  tooltip: "BlueSky",
                ),

                //Spacing
                const SizedBox(width: 20),

                //Instagram
                Buttons.iconFilled(
                  icon: Feather.instagram,
                  onTap: _launchInstagram,
                  tooltip: "Instagram",
                ),
              ],
            ),

            //Spacing
            const SizedBox(height: 20),

            //Expandable Contact Form
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ExpansionTile(
                title: const Text("Contact Form"),
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                collapsedShape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                backgroundColor: Theme.of(context).dialogBackgroundColor,
                collapsedBackgroundColor:
                    Theme.of(context).dialogBackgroundColor,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ContactForm(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchGitHub() {
    launchUrl(Uri.parse("https://github.com/danfq"));
  }

  void _launchBlueSky() {
    launchUrl(Uri.parse("https://bsky.app/profile/danfq.dev"));
  }

  void _launchInstagram() {
    launchUrl(Uri.parse("https://www.instagram.com/danfq.dev/"));
  }
}
