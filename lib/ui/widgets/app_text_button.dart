import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  AppTextButton(
      {super.key,
      required this.child,
      required this.onTap,
      required this.text});

  final Widget child;
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        child,
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
