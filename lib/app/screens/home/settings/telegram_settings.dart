import 'package:flutter/material.dart';

class TelegramSettings extends StatefulWidget {
  const TelegramSettings({Key? key}) : super(key: key);

  @override
  State<TelegramSettings> createState() => _TelegramSettingsState();
}

class _TelegramSettingsState extends State<TelegramSettings> {
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
      body: const Center(
        child: Text("Telegram Settings"),
      ),
    );
  }
}
