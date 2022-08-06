import 'package:flutter/material.dart';

class TFA_Field extends StatefulWidget {
  const TFA_Field({
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
  State<TFA_Field> createState() => _TFA_FieldState();
}

class _TFA_FieldState extends State<TFA_Field> {
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
