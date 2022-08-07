import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<void> _showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final List<Map> settingsItems = [
    {
      "title": "Profile",
      "details": "Change you name, surname, picture and etc.",
      "icon": Icons.medical_information,
    },
    {
      "title": "Security",
      "details": "Fields like changing email and password.",
      "icon": Icons.security,
    },
    {
      "title": "Telegram",
      "details": "Settings related to Telegram, like changing tid.",
      "icon": Icons.telegram,
    },
    {
      "title": "About and policy",
      "details": "Read about or terms and stuff related.",
      "icon": Icons.local_police_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Settings",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const Divider(color: Colors.blue),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: settingsItems.length,
            // separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                iconColor: Colors.blue,
                tileColor: Colors.white,
                leading: Icon(settingsItems[index]['icon']),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: Text(settingsItems[index]['title']),
                subtitle: Text(
                  settingsItems[index]['details'],
                  style: const TextStyle(
                    fontSize: 11,
                  ),
                ),
                onTap: () {},
              );
            },
          ),
        )
      ],
    );
  }
}
