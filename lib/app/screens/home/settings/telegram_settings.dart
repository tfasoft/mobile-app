import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfasoft_mobile/app/services/state.dart';
import 'package:tfasoft_mobile/app/widgets/button/tfa_button.dart';
import 'package:tfasoft_mobile/app/widgets/field/tfa_field.dart';
import 'package:tfasoft_mobile/app/widgets/title/page_subtitle.dart';

class TelegramSettings extends StatefulWidget {
  const TelegramSettings({Key? key}) : super(key: key);

  @override
  State<TelegramSettings> createState() => _TelegramSettingsState();
}

class _TelegramSettingsState extends State<TelegramSettings> {
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

  final TextEditingController _tid = TextEditingController();

  Future<void> changeMCode(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Sure to change MCode?"),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text("Here you can generate a new m-code. It is no necessary but it is good to do.")
              ],
            ),
          ),
          actions: [
            TFA_Button(
              variant: "text",
              text: "Close",
              onClick: () => Navigator.pop(context),
            ),
            TFA_Button(
              variant: "contained",
              text: "Yes, generate",
              onClick: () {},
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
            const PageSubTitle(title: 'Change Telegram ID'),
            TFA_Field(
              variant: "outlined",
              password: false,
              label: "Telegram ID",
              hint: "Enter your new TID",
              controller: _tid,
            ),
            const SizedBox(height: 10),
            TFA_Button(
              variant: "contained",
              onClick: () {},
              text: "Update Telegram ID",
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.blueGrey),
            const SizedBox(height: 10),
            const PageSubTitle(title: 'Change Mobile Code'),
            TFA_Button(
              variant: "contained",
              onClick: () => changeMCode(context),
              text: "Change M-Code",
            ),
          ],
        ),
      ),
    );
  }
}
