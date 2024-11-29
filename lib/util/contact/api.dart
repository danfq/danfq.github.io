import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

///Contact API
class ContactAPI {
  ///Send Contact Form
  static Future<void> sendContactForm({
    required String name,
    required String email,
    required String message,
    String? phone,
  }) async {
    //Mail-To Link
    final mailToLink = Mailto(
      to: ["danfq.dev@proton.me"],
      subject: "Portfolio Contact",
      body: "Name: $name\nEmail: $email\nPhone: $phone\n\n\n\"$message\"",
    );

    //Open Mail-To Link
    await launchUrl(Uri.parse(mailToLink.toString()));
  }
}
