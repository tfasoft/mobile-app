// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TFAField extends StatefulWidget {
  const TFAField({
    Key? key,
    this.variant,
    this.label,
    this.hint,
    this.password,
    this.controller
  }) : super(key: key);

  final variant;
  final label;
  final hint;
  final password;
  final controller;

  @override
  State<TFAField> createState() => _TFAFieldState();
}

class _TFAFieldState extends State<TFAField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.password,
      decoration: InputDecoration(
        hintText: widget.hint,
        label: Text(widget.label),
        border: widget.variant == "outlined" ? const OutlineInputBorder() : null,
      ),
    );
  }
}
