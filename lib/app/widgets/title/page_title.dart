// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class UnderAppBar extends StatefulWidget {
  const UnderAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  final title;

  @override
  State<UnderAppBar> createState() => _UnderAppBarState();
}

class _UnderAppBarState extends State<UnderAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
