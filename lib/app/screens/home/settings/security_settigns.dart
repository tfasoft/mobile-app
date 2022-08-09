import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tfasoft_mobile/app/services/api.dart';
import 'package:tfasoft_mobile/app/services/state.dart';
import 'package:tfasoft_mobile/app/widgets/button/tfa_button.dart';
import 'package:tfasoft_mobile/app/widgets/field/tfa_field.dart';
import 'package:tfasoft_mobile/app/widgets/title/page_subtitle.dart';

class SecuritySettings extends StatefulWidget {
  const SecuritySettings({Key? key}) : super(key: key);

  @override
  State<SecuritySettings> createState() => _SecuritySettingsState();
}

class _SecuritySettingsState extends State<SecuritySettings> {
  final DioClient _client = DioClient();

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

  bool loadingEmail = false;
  bool loadingPassword = false;

  Future<void> changeEmail(BuildContext context) async {
    setState(() => loadingEmail = true);

    String uid = Provider.of<AppState>(context, listen: false).getUid;
    Map data = {
      "email": _email.text,
    };

    var response = _client.changeUserData(uid, data);

    response.then((result) {
      setState(() => loadingEmail = false);

      if (result.statusCode == 200) {
        _showSnackBar(context, "Email updated successfully");
      }
    });
  }

  Future<void> changePassword(BuildContext context) async {
    setState(() => loadingPassword = true);

    String currentPassword = Provider.of<AppState>(context, listen: false).getUser['password'];

    if (_currentPassword.text == currentPassword) {
      if (_newPassword.text == _confirmPassword.text) {
        String uid = Provider.of<AppState>(context, listen: false).getUid;
        Map data = {
          "password": _newPassword.text,
        };

        var response = _client.changeUserData(uid, data);

        response.then((result) {
          setState(() => loadingPassword = false);

          if (result.statusCode == 200) {
            _showSnackBar(context, "Password updated successfully");
          }
        });
      } else {
        setState(() => loadingPassword = false);
        _showSnackBar(context, "Passwords are not match");
      }
    } else {
      setState(() => loadingPassword = false);
      _showSnackBar(context, "Current password is wrong");
    }
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
              onClick: loadingEmail ? null : () => changeEmail(context),
              text: "Update Email",
            ),
            const SizedBox(height: 20),
            const PageSubTitle(title: 'Change password'),
            TFA_Field(
              variant: "outlined",
              password: true,
              label: "Current password",
              hint: "Enter your current password",
              controller: _currentPassword,
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: TFA_Field(
                    variant: "outlined",
                    password: true,
                    label: "New password",
                    hint: "Enter your new password",
                    controller: _newPassword,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TFA_Field(
                    variant: "outlined",
                    password: true,
                    label: "Confirm password",
                    hint: "Enter your confirm password",
                    controller: _confirmPassword,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TFA_Button(
              variant: "contained",
              onClick: loadingPassword ? null : () => changePassword(context),
              text: "Change password",
            ),
          ],
        ),
      ),
    );
  }
}
