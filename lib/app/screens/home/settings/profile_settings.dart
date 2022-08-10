import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tfasoft_mobile/app/services/api.dart';
import 'package:tfasoft_mobile/app/services/state.dart';
import 'package:tfasoft_mobile/app/widgets/button/tfa_button.dart';
import 'package:tfasoft_mobile/app/widgets/field/tfa_field.dart';
import 'package:tfasoft_mobile/app/widgets/title/page_subtitle.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
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

  final TextEditingController _name = TextEditingController();

  bool loadingName = false;

  Future<void> changeName(BuildContext context) async {
    setState(() => loadingName = true);

    String uid = Provider.of<AppState>(context, listen: false).getUid;
    Map data = {
      "name": _name.text,
    };

    var response = _client.changeUserData(uid, data);

    response.then((result) {
      setState(() => loadingName = false);

      if (result.statusCode == 200) {
        _showSnackBar(context, "Name updated successfully");
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
        title: const Text("Profile Settings"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PageSubTitle(title: 'Change name'),
            TFAField(
              variant: "outlined",
              password: false,
              label: "Name",
              hint: "Enter your new namw",
              controller: _name,
            ),
            const SizedBox(height: 10),
            TFAButon(
              variant: "contained",
              onClick: loadingName ? null : () => changeName(context),
              text: "Update name",
            ),
          ],
        ),
      ),
    );
  }
}
