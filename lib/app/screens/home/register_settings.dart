import 'package:flutter/material.dart';
import 'package:tfasoft_mobile/app/widgets/button/tfa_button.dart';
import 'package:tfasoft_mobile/app/widgets/field/tfa_field.dart';
import 'package:tfasoft_mobile/app/widgets/title/page_subtitle.dart';

class RegisterSettings extends StatefulWidget {
  const RegisterSettings({Key? key}) : super(key: key);

  @override
  State<RegisterSettings> createState() => _RegisterSettingsState();
}

class _RegisterSettingsState extends State<RegisterSettings> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> _showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        textColor: Colors.blue,
        label: 'Close',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Account Settings"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PageSubTitle(title: 'Enter email and password'),
            TFA_Field(
              variant: "outlined",
              password: false,
              label: "Email",
              hint: "Enter your email",
              controller: _email,
            ),
            const SizedBox(height: 10),
            TFA_Field(
              variant: "outlined",
              password: false,
              label: "Password",
              hint: "Enter your password",
              controller: _password,
            ),
            const SizedBox(height: 10),
            TFA_Button(
              variant: "contained",
              onClick: () {},
              text: "Register account",
            ),
          ],
        ),
      ),
    );
  }
}
