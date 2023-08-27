import 'package:flutter/material.dart';

import '../../style/colors.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obsecure});

  final String? hintText;
  final TextEditingController controller;
  final bool? obsecure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        controller: controller,
        obscureText: obsecure ?? false,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            fillColor: colorWhite,
            hintText: hintText,
            filled: true,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
