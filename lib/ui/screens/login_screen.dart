import 'package:flutter/material.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';
import '../../style/text_style.dart';
import '../widgets/app_text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackgroun(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Get Started With',
              style: Head1Text,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          AppTextField(
            controller: TextEditingController(),
            hintText: 'Email',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AppTextField(
              hintText: 'Password',
              controller: TextEditingController(),
              obsecure: true,
            ),
          )
        ],
      ),
    ));
  }
}
