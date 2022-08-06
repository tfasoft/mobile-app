import 'package:flutter/material.dart';

class TFA_FullWidthButton extends StatefulWidget {
  const TFA_FullWidthButton({
    Key? key,
    this.text,
    this.variant,
    this.onClick,
  }) : super(key: key);

  final text;
  final variant;
  final onClick;

  @override
  State<TFA_FullWidthButton> createState() => _TFA_FullWidthButtonState();
}

class _TFA_FullWidthButtonState extends State<TFA_FullWidthButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: widget.variant == "contained"
          ? ElevatedButton(
              onPressed: widget.onClick,
              child: Text(widget.text),
              style: ElevatedButton.styleFrom(
                elevation: 0,
              ),
            )
          : widget.variant == "text"
              ? TextButton(
                  onPressed: widget.onClick,
                  child: Text(widget.text),
                )
              : widget.variant == "outlined"
                  ? OutlinedButton(
                      onPressed: widget.onClick,
                      child: Text(widget.text),
                    )
                  : ElevatedButton(
                      onPressed: widget.onClick,
                      child: Text(widget.text),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                    ),
    );
  }
}
