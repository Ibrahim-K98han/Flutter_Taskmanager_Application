import 'package:flutter/material.dart';

import '../../style/colors.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obsecureText,
      this.validator,
      this.maxLines,
      this.readOnly
      });

  final String hintText;
  final TextEditingController controller;
  final bool? obsecureText;
  final int? maxLines;
  final Function(String?)? validator;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText ?? false,
      maxLines: maxLines ?? 1,
      readOnly: readOnly ?? false,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          fillColor: colorWhite,
          hintText: hintText,
          filled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
