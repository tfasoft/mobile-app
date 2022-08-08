import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tfasoft_mobile/app/services/api.dart';
import 'package:tfasoft_mobile/app/services/state.dart';

import 'package:tfasoft_mobile/app/widgets/button/tfa_button.dart';
import 'package:tfasoft_mobile/app/widgets/title/page_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  Future<void> _getLoginToken(BuildContext context) async {
    var response = _client.getLoginToken(Provider.of<AppState>(context, listen: false).getUser["tid"]);

    response.then((result) {
      if (result.statusCode == 200) {
        Map data = result.data;

        FlutterClipboard.copy(data['token'])
          .then((success) => _showSnackBar(context, "Token copied"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const UnderAppBar(title: "Home"),
        Expanded(child: Container()),
        TFA_Button(
          variant: "contained",
          text: "Get access token",
          onClick: () => _getLoginToken(context),
        ),
      ],
    );
  }
}
