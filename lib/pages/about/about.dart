import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/route_manager.dart';
import 'package:portfolio/util/widgets/buttons.dart';
import 'package:portfolio/util/widgets/main.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  String aboutMeText = "";

  ///Load About Me Text
  Future<void> loadAboutMeText() async {
    //Text
    final text = await DefaultAssetBundle.of(context).loadString(
      "assets/txt/about.txt",
    );

    //Update UI
    setState(() {
      aboutMeText = text;
    });
  }

  @override
  void initState() {
    super.initState();
    loadAboutMeText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainWidgets.appBar(title: const Text("About Me")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            //Photo
            Center(
              child: Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Image.asset("assets/img/me.jpg"),
                ),
              ),
            ),

            //Spacing
            const SizedBox(width: 20.0),

            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Text About Me
                Text(
                  aboutMeText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                //Spacing
                const SizedBox(height: 40.0),

                //Contact Button
                Buttons.elevatedIcon(
                  text: "Contact Me",
                  icon: Ionicons.mail_outline,
                  onTap: () {
                    //Go to Contact Page
                    Get.toNamed("/contact");
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}