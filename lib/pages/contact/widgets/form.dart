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
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red.shade200),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hoverColor: Colors.transparent,
      floatingLabelStyle: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
      ),
      labelStyle: TextStyle(
        color: Colors.grey.shade400,
      ),
      errorStyle: TextStyle(
        color: Colors.red.shade200,
      ),
    );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: inputDecoration.copyWith(
              labelText: "Name",
              hintText: "Enter Your Name",
              prefixIcon: const Icon(Ionicons.ios_person_outline),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Your Name";
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: inputDecoration.copyWith(
              labelText: "E-mail",
              hintText: "Enter Your E-mail Address",
              prefixIcon: const Icon(Ionicons.ios_mail_outline),
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

          //Spacing
          const SizedBox(height: 16),

          //Phone
          TextFormField(
            controller: _phoneController,
            decoration: inputDecoration.copyWith(
              labelText: "Phone (optional)",
              hintText: "Enter Your Phone Number",
              prefixIcon: const Icon(Ionicons.ios_phone_portrait_outline),
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),

          //Spacing
          const SizedBox(height: 16),

          //Phone
          TextFormField(
            controller: _messageController,
            decoration: inputDecoration.copyWith(
              labelText: "Message",
              hintText: "Enter Your Message",
              prefixIcon: const Icon(Ionicons.ios_text_outline),
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

          //Spacing
          const SizedBox(height: 24),

          //Submit Button
          Buttons.elevatedIcon(
            text: "Submit",
            icon: Ionicons.ios_send_outline,
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                //Name
                final name = _nameController.text.trim();

                //Email
                final email = _emailController.text.trim();

                //Phone
                final phone = _phoneController.text.trim();

                //Message
                final message = _messageController.text.trim();

                //Check Name & E-mail
                if (name.isEmpty || email.isEmpty || message.isEmpty) {
                  return;
                }

                //Send Contact Form
                await ContactAPI.sendContactForm(
                  name: name,
                  email: email,
                  phone: phone,
                  message: message,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
