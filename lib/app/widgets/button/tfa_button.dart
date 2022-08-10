// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TFAButon extends StatefulWidget {
  const TFAButon({
    Key? key,
    this.text,
    this.variant,
    this.onClick,
  }) : super(key: key);

  final text;
  final variant;
  final onClick;

  @override
  State<TFAButon> createState() => _TFAButonState();
}

class _TFAButonState extends State<TFAButon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: widget.variant == "contained"
          ? ElevatedButton(
              onPressed: widget.onClick,
              style: ElevatedButton.styleFrom(
                elevation: 0,
              ),
              child: Text(widget.text),
            )
          : widget.variant == "text"
              ? TextButton(
                  onPressed: widget.onClick,
                  child: Text(widget.text),
                )
              : widget.variant == "outlined"
                  ? OutlinedButton(
                      onPressed: widget.onClick,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: Colors.blueGrey,
                        ),
                      ),
                      child: Text(widget.text),
                    )
                  : ElevatedButton(
                      onPressed: widget.onClick,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                      child: Text(widget.text),
                    ),
    );
  }
}
