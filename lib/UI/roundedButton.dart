import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color;
  final Color backgroundColor;
  final double? fontSize;
  final TextStyle? textStyle;
  final bool hasBorder;

  const RoundedButton(
      {required this.text,
      required this.color,
      required this.backgroundColor,
      required this.onPressed,
      this.fontSize,
      this.textStyle,
        this.hasBorder = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll<double>(0),
        backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor),
        foregroundColor: MaterialStatePropertyAll<Color>(color),
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
        side: MaterialStatePropertyAll<BorderSide>(
          hasBorder ?
          BorderSide(width: 2, color: color) : const BorderSide(width: 0),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
