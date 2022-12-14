import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfasoft_mobile/app/services/api.dart';
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

  final TextEditingController _tid = TextEditingController();

  bool loadingChangeMcode = false;
  bool loadingChangeTID = false;

  Future<void> changeMCode(BuildContext context) async {
    setState(() => loadingChangeMcode = true);

    String uid = Provider.of<AppState>(context, listen: false).getUid;

    var response = _client.regenerateMCode(uid);

    response.then((result) {
      setState(() => loadingChangeMcode = false);

      if (result.statusCode == 200) {
        _showSnackBar(context, "MCode regenerated successfully");
      } else {
        _showSnackBar(context, result.data['message']);
      }
    });
  }

  Future<void> changeTID(BuildContext context) async {
    setState(() => loadingChangeTID = true);

    String uid = Provider.of<AppState>(context, listen: false).getUid;
    Map data = {
      "tid": _tid.text,
    };

    var response = _client.changeUserData(uid, data);

    response.then((result) {
      setState(() => loadingChangeTID = false);

      if (result.statusCode == 200) {
        _showSnackBar(context, "Telegram ID changes successfully");
      } else {
        _showSnackBar(context, result.data['message']);
      }
    });
  }

  Future<void> changeMCodeDialog(BuildContext context) async {
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
            TFAButon(
              variant: "text",
              text: "Close",
              onClick: () => Navigator.pop(context),
            ),
            TFAButon(
              variant: "contained",
              text: "Yes, generate",
              onClick: loadingChangeMcode ? null : () => changeMCode(context),
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
            TFAField(
              variant: "outlined",
              password: false,
              label: "Telegram ID",
              hint: "Enter your new TID",
              controller: _tid,
            ),
            const SizedBox(height: 10),
            TFAButon(
              variant: "contained",
              onClick: loadingChangeTID ? null : () => changeTID(context),
              text: "Update Telegram ID",
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.blueGrey),
            const SizedBox(height: 10),
            const PageSubTitle(title: 'Change Mobile Code'),
            TFAButon(
              variant: "contained",
              onClick: () => changeMCodeDialog(context),
              text: "Change M-Code",
            ),
          ],
        ),
      ),
    );
  }
}
