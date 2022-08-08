import 'package:flutter/material.dart';
import 'package:tfasoft_mobile/app/widgets/button/tfa_button.dart';
import 'package:tfasoft_mobile/app/widgets/field/tfa_field.dart';
import 'package:tfasoft_mobile/app/widgets/title/page_subtitle.dart';

class SecuritySettings extends StatefulWidget {
  const SecuritySettings({Key? key}) : super(key: key);

  @override
  State<SecuritySettings> createState() => _SecuritySettingsState();
}

class _SecuritySettingsState extends State<SecuritySettings> {
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

  final TextEditingController _email = TextEditingController();

  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _currentPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Telegram Settings"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PageSubTitle(title: 'Change Email'),
            TFA_Field(
              variant: "outlined",
              password: false,
              label: "Email",
              hint: "Enter your new email",
              controller: _email,
            ),
            const SizedBox(height: 10),
            TFA_Button(
              variant: "contained",
              onClick: () {},
              text: "Update Email",
            ),
            const SizedBox(height: 20),
            const PageSubTitle(title: 'Change password'),
            Row(
              children: <Widget>[
                Expanded(
                  child: TFA_Field(
                    variant: "outlined",
                    password: false,
                    label: "New password",
                    hint: "Enter your new password",
                    controller: _newPassword,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TFA_Field(
                    variant: "outlined",
                    password: false,
                    label: "Confirm password",
                    hint: "Enter your confirm password",
                    controller: _confirmPassword,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TFA_Field(
              variant: "outlined",
              password: false,
              label: "Current password",
              hint: "Enter your current password",
              controller: _currentPassword,
            ),
            const SizedBox(height: 10),
            TFA_Button(
              variant: "contained",
              onClick: () {},
              text: "Change password",
            ),
          ],
        ),
      ),
    );
  }
}
