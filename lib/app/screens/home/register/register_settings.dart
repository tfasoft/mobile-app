import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfasoft_mobile/app/services/api.dart';
import 'package:tfasoft_mobile/app/services/state.dart';
import 'package:tfasoft_mobile/app/widgets/button/tfa_button.dart';
import 'package:tfasoft_mobile/app/widgets/field/tfa_field.dart';
import 'package:tfasoft_mobile/app/widgets/title/page_subtitle.dart';

class RegisterSettings extends StatefulWidget {
  const RegisterSettings({Key? key}) : super(key: key);

  @override
  State<RegisterSettings> createState() => _RegisterSettingsState();
}

class _RegisterSettingsState extends State<RegisterSettings> {
  final DioClient _client = DioClient();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();

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

  bool registerLoading = false;

  Future<void> _registerUser(BuildContext context) async {
    setState(() => registerLoading = true);

    String uid = Provider.of<AppState>(context, listen: false).getUid;
    Map data = {
      "name": _name.text,
      "email": _email.text,
      "password": _password.text,
    };

    var response = _client.register(uid.toString(), data);

    response.then((result) {
      setState(() => registerLoading = false);

      if (result.statusCode == 200) {
        Navigator.of(context).pop();

        _showSnackBar(context, "You are registered!");
      } else {
        _showSnackBar(context, "Sorry, there is an error.");
      }
    });
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const PageSubTitle(title: 'Enter these data please'),
                TFAField(
                  variant: "outlined",
                  password: false,
                  label: "Name",
                  hint: "Enter your name",
                  controller: _name,
                ),
                const SizedBox(height: 10),
                TFAField(
                  variant: "outlined",
                  password: false,
                  label: "Email",
                  hint: "Enter your email",
                  controller: _email,
                ),
                const SizedBox(height: 10),
                TFAField(
                  variant: "outlined",
                  password: true,
                  label: "Password",
                  hint: "Enter your password",
                  controller: _password,
                ),
                const SizedBox(height: 10),
                TFAButon(
                  variant: "contained",
                  onClick: !registerLoading ? () => _registerUser(context) : null,
                  text: "Register account",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
