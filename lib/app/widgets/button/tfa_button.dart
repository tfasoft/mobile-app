import 'package:flutter/material.dart';

class TFA_Button extends StatefulWidget {
  const TFA_Button({
    Key? key,
    this.text,
    this.variant,
    this.onClick,
  }) : super(key: key);

  final text;
  final variant;
  final onClick;

  @override
  State<TFA_Button> createState() => _TFA_ButtonState();
}

class _TFA_ButtonState extends State<TFA_Button> {
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
                      child: Text(widget.text),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                    ),
    );
  }
}
