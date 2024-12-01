import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:portfolio/util/contact/api.dart';
import 'package:portfolio/util/widgets/buttons.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  ///Form Key
  final _formKey = GlobalKey<FormState>();

  //Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    //Dispose of Controllers
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CupertinoFormSection.insetGrouped(
            backgroundColor: Colors.transparent,
            decoration: BoxDecoration(
              color: CupertinoColors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.zero,
            children: [
              CupertinoTextFormFieldRow(
                style: const TextStyle(color: CupertinoColors.label),
                placeholderStyle: const TextStyle(
                  color: CupertinoColors.systemGrey,
                ),
                controller: _nameController,
                prefix: const Icon(
                  Ionicons.ios_person_outline,
                  color: CupertinoColors.systemGrey,
                ),
                placeholder: "Enter Your Name",
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Name";
                  }
                  return null;
                },
              ),
              CupertinoTextFormFieldRow(
                style: const TextStyle(color: CupertinoColors.label),
                placeholderStyle: const TextStyle(
                  color: CupertinoColors.systemGrey,
                ),
                controller: _emailController,
                prefix: const Icon(
                  Ionicons.ios_mail_outline,
                  color: CupertinoColors.systemGrey,
                ),
                placeholder: "Enter Your E-mail Address",
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your E-mail Address";
                  }
                  if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                      .hasMatch(value)) {
                    return "Please Enter a Valid E-mail Address";
                  }
                  return null;
                },
              ),
              CupertinoTextFormFieldRow(
                style: const TextStyle(color: CupertinoColors.label),
                placeholderStyle: const TextStyle(
                  color: CupertinoColors.systemGrey,
                ),
                controller: _phoneController,
                prefix: const Icon(
                  Ionicons.ios_phone_portrait_outline,
                  color: CupertinoColors.systemGrey,
                ),
                placeholder: "Enter Your Phone Number (optional)",
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ],
          ),

          //Spacing
          const SizedBox(height: 16),

          //Message Field
          CupertinoFormSection.insetGrouped(
            backgroundColor: Colors.transparent,
            decoration: BoxDecoration(
              color: CupertinoColors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.zero,
            children: [
              CupertinoTextFormFieldRow(
                style: const TextStyle(color: CupertinoColors.label),
                placeholderStyle: const TextStyle(
                  color: CupertinoColors.systemGrey,
                ),
                controller: _messageController,
                prefix: const Icon(
                  Ionicons.ios_chatbubble_outline,
                  color: CupertinoColors.systemGrey,
                ),
                placeholder: "Enter Your Message",
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Message";
                  }
                  return null;
                },
              ),
            ],
          ),

          //Spacing
          const SizedBox(height: 24),

          //Submit Button
          CupertinoButton.filled(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                //Inputs
                final name = _nameController.text.trim();
                final email = _emailController.text.trim();
                final phone = _phoneController.text.trim();
                final message = _messageController.text.trim();

                //Validate Inputs
                if (name.isEmpty || email.isEmpty || message.isEmpty) return;

                //Send Contact Form
                await ContactAPI.sendContactForm(
                  name: name,
                  email: email,
                  phone: phone,
                  message: message,
                );
              }
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Ionicons.ios_send_outline),
                SizedBox(width: 8),
                Text("Submit"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
