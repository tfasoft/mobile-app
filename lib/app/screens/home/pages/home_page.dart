import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tfasoft_mobile/app/services/state.dart';

import 'package:tfasoft_mobile/app/widgets/title/page_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    Map user = Provider.of<AppState>(context, listen: false).getUser;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UnderAppBar(title: "Hello ${user['name']}"),
        const Text("To Get the Token, tab on the bottrom corner button and then it will be generate and copy!"),
      ],
    );
  }
}
