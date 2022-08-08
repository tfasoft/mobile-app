import 'package:flutter/material.dart';
import 'package:tfasoft_mobile/app/screens/home/register_settings.dart';
import 'package:tfasoft_mobile/app/widgets/button/tfa_button.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome!"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Congregate 🎉",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                    "First, welcome to TFAmobile. We are so glad that your are going to use our software."),
                const SizedBox(height: 10),
                const Text(
                    "Ok, one more step is to choose an email and a password for your mobile account. In this way, every time you want to login to the app, you can use your email and password."),
                const SizedBox(height: 10),
                const Text(
                    "Just tap on the register button and fill the blank fields."),
                const SizedBox(height: 10),
                const Text(
                  "Remember: You can change your information in future again.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TFA_Button(
                  text: "Register account",
                  onClick: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterSettings(),
                    ),
                  ),
                  variant: "contained",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
