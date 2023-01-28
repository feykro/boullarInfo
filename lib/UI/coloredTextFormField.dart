import 'package:flutter/material.dart';

class ColoredTextFormFieldBuilder {
  static Widget getColoredTextFormField({
    Color? mainColor,
    Color? backgroundColor,
    IconData? icon,
    required String lblText,
    bool isSecret = false,
    required TextEditingController controller,
    Function(String)? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Padding(
        padding: icon != null ? const EdgeInsets.only(left: 5, right: 20) : const EdgeInsets.only(left: 44, right: 20),
        child: TextFormField(
          controller: controller,
          cursorColor: mainColor,
          autocorrect: false,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            icon: icon != null ? Icon(icon, color: mainColor) : null,
            labelText: lblText,
            labelStyle: TextStyle(color: mainColor),
          ),
          obscureText: isSecret,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: mainColor,
          ),
        ),
      ),
    );
  }
}
