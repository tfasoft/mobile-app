import 'package:flutter/material.dart';
import 'package:tfasoft_mobile/app/widgets/buttons/full_width_button.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login / Register'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    "TFAsoft",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                const SizedBox(height: 30),
                TFA_FullWidthButton(
                  text: "Login",
                  variant: "contained",
                  onClick: () => print("Hi"),
                ),
                const SizedBox(height: 10),
                TFA_FullWidthButton(
                  text: "Register",
                  variant: "contained",
                  onClick: () => print("Hi"),
                ),
                const SizedBox(height: 20),
                TFA_FullWidthButton(
                  text: "Read manual",
                  variant: "text",
                  onClick: () => {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
