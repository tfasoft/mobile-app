import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:tfasoft_mobile/app/services/api.dart';
import 'package:tfasoft_mobile/app/services/state.dart';

import 'package:tfasoft_mobile/app/widgets/button/tfa_button.dart';
import 'package:tfasoft_mobile/app/widgets/field/tfa_field.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final DioClient _client = DioClient();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mcode = TextEditingController();

  bool _loadingLogin = false;
  bool _loadingConnect = false;

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

  Future<void> _openUrl(BuildContext context, String link) async {
    final Uri url = Uri.parse(link);

    if (!await launchUrl(url)) {
      _showSnackBar(context, "Can not open $url");
    }
  }

  Future<void> _loginUser(BuildContext context) async {
    setState(() => _loadingLogin = true);

    var response = _client.login(_email.text, _password.text);

    response.then((result) {
      setState(() => _loadingLogin = false);
      if (result.statusCode == 200) {
        Map user = result.data;

        _email.clear();
        _password.clear();

        Provider.of<AppState>(context, listen: false).login(user["_id"]);
      } else if (result.statusCode == 401) {
        _showSnackBar(context, result.data['message']);
      } else {
        _showSnackBar(context, "Sorry, an error!");
      }
    });
  }

  Future<void> _connectUser(BuildContext context) async {
    setState(() => _loadingConnect = true);

    var response = _client.connect(_mcode.text);

    response.then((result) {
      setState(() => _loadingConnect = false);

      if (result.statusCode == 200) {
        Map user = result.data;

        _mcode.clear();
        Navigator.of(context).pop();

        Provider.of<AppState>(context, listen: false).login(user["_id"]);
      } else if (result.statusCode == 401) {
        _showSnackBar(context, result.data['message']);
      } else {
        _showSnackBar(context, "Sorry, an error!");
      }
    });
  }

  Future<void> _connectDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Connect to Telegram"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TFAField(
                  password: true,
                  controller: _mcode,
                  variant: "outlined",
                  hint: "Enter M-Code",
                  label: "M-Code",
                ),
                const SizedBox(height: 10),
                const Text(
                  "If you don't know how to connect your mobile to Telegram, read manual by clicking the manual button.",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TFAButon(
              variant: "text",
              text: "Close",
              onClick: () {
                Navigator.of(context).pop();
              },
            ),
            TFAButon(
              variant: "contained",
              text: "Connect",
              onClick: !_loadingConnect ? () => _connectUser(context) : null,
            )
          ],
        );
      },
    );
  }

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
                    "TFAsoft Mobile",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TFAField(
                  password: false,
                  controller: _email,
                  variant: "outlined",
                  hint: "Enter email",
                  label: "Email",
                ),
                const SizedBox(height: 10),
                TFAField(
                  password: true,
                  controller: _password,
                  variant: "outlined",
                  hint: "Enter password",
                  label: "Password",
                ),
                const SizedBox(height: 10),
                TFAButon(
                  text: "Login",
                  variant: "contained",
                  onClick: !_loadingLogin ? () => _loginUser(context) : null,
                ),
                const SizedBox(height: 10),
                TFAButon(
                  text: "Connect to Telegram",
                  variant: "outlined",
                  onClick: () => _connectDialog(context),
                ),
                const SizedBox(height: 20),
                TFAButon(
                  text: "Read manual",
                  variant: "text",
                  onClick: () => _openUrl(context, "https://mobile.amirhossein.info/manual"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
