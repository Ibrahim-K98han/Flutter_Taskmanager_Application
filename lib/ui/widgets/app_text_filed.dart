import 'package:flutter/material.dart';

import '../../style/colors.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obsecure,
      this.maxLines});

  final String? hintText;
  final TextEditingController controller;
  final bool? obsecure;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecure ?? false,
      maxLines: maxLines,
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
