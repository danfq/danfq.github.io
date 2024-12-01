import 'package:download/download.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  ///Current Age
  int currentAge = DateTime.now().year - 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainWidgets.appBar(title: const Text("About Me")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              //Photo
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: Image.asset("assets/img/me.jpg"),
                  ),
                ),
              ),

              //Spacing
              const SizedBox(width: 20.0),

              //Allow for Expanded
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Text About Me
                      Text(
                        aboutMeText.replaceAll(
                          "{{ age }}",
                          currentAge.toString(),
                        ),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      //Spacing
                      const SizedBox(height: 40.0),

                      //Contact & CV Buttons
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            //Contact Button
                            Buttons.elevatedIcon(
                              text: "Contact Me",
                              icon: Ionicons.mail_outline,
                              onTap: () {
                                Get.toNamed("/contact");
                              },
                            ),

                            //Spacing
                            const SizedBox(width: 10),

                            //Download CV Button
                            Buttons.elevatedIcon(
                              text: "Download CV",
                              icon: Ionicons.document_outline,
                              onTap: () async {
                                //Current Date
                                final now = DateTime.now();
                                final day = now.day;
                                final month = now.month;
                                final year = now.year;

                                //Load CV from Assets
                                final cvData = await rootBundle.load(
                                  "assets/doc/CV_01_12_2024.pdf",
                                );

                                //Get Bytes
                                final bytes = cvData.buffer.asUint8List();

                                //Create Stream
                                final stream = Stream.fromIterable(bytes);

                                //Download CV
                                download(
                                  stream,
                                  "DanFQ_CV_${day}_${month}_$year.pdf",
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
