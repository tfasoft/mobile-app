import 'package:flutter/material.dart';

class PageSubTitle extends StatefulWidget {
  const PageSubTitle({
    Key? key,
    this.title,
  }) : super(key: key);

  final title;

  @override
  State<PageSubTitle> createState() => _PageSubTitleState();
}

class _PageSubTitleState extends State<PageSubTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
