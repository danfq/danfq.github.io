import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact/widgets/form.dart';
import 'package:portfolio/util/widgets/main.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainWidgets.appBar(title: const Text("Contact Me")),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Contact Form
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ContactForm(),
            ),
          ],
        ),
      ),
    );
  }
}
