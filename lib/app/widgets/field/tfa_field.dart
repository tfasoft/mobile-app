import 'package:flutter/material.dart';

class TFA_Field extends StatefulWidget {
  const TFA_Field({
    Key? key,
    this.variant,
    this.label,
    this.hint,
    this.controller
  }) : super(key: key);

  final variant;
  final label;
  final hint;
  final controller;

  @override
  State<TFA_Field> createState() => _TFA_FieldState();
}

class _TFA_FieldState extends State<TFA_Field> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.hint,
        label: Text(widget.label),
        border: widget.variant == "outlined" ? const OutlineInputBorder() : null,
      ),
    );
  }
}
