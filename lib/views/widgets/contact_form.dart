import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'text_from_field_widget.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final messageController = TextEditingController();

  bool isLoading = false;

  Future<void> sendEmail() async {
    setState(() => isLoading = true);

    final url = "https://api.emailjs.com/api/v1.0/email/send";

    final data = {
      "service_id": "service_2pq7bhd",
      "template_id": "template_bca0tbe",
      "user_id": "X5MT3ODMXfGFPaWJD",
      "template_params": {
        "name": nameController.text,
        "email": emailController.text,
        "message": messageController.text,
      }
    };

    try {
      final response = await Dio().post(
        url,
        data: data,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("✅ پیام با موفقیت ارسال شد")),
        );
        nameController.clear();
        emailController.clear();
        messageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ خطا در ارسال پیام")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("⚠️ خطا: $e")),
      );
      print(e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 20,
        children: [
          TextFormFieldWidget(
            controller: nameController,
            label: "Name",
            validator: (name) {
              if (name == null || name.isEmpty) {
                return "Enter Your Name...";
              }
              return null;
            },
          ),

          TextFormFieldWidget(
            controller: emailController,
            label: "Email",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Your Email...";
              }
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return "Invalid email";
              }
              return null;
            },
          ),

          TextFormFieldWidget(
            controller: messageController,
            label: "Message...",
            minLines: 4,
            maxLines: 4,
            validator: (message) {
              if (message == null || message.isEmpty) {
                return "Enter Your Message...";
              }
              return null;
            },
          ),

          SizedBox(
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 24,
              children: [
                isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        sendEmail();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      foregroundColor: Colors.black,
                    ),
                    child: Text("Get In Touch"),
                  ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFB84D1D),
                        Color(0xFF8A1F5A),
                        Color(0xFF5B247A),
                        Color(0xFF2C2E91),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: IconButton.filled(
                    onPressed: (){}, 
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.transparent
                    ),
                    icon: Icon(FontAwesomeIcons.instagram)
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF2B6F89),
                        Color(0xFF1B5A72),
                        Color(0xFF0F4157),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: IconButton.filled(
                    onPressed: (){},
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.transparent
                    ),
                    icon: Icon(FontAwesomeIcons.telegram),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF004C75),
                        Color(0xFF006D8E),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: IconButton.filled(
                    onPressed: (){}, 
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.transparent
                    ),
                    icon: Icon(FontAwesomeIcons.linkedin),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
