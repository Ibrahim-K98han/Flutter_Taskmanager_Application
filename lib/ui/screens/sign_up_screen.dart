import 'package:flutter/material.dart';

import '../../style/text_style.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_filed.dart';
import '../widgets/screen_background.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroun(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Join With US',
                style: Head1Text,
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
                  hintText: 'First Name',
                  controller: TextEditingController(),
                  obsecure: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: AppTextField(
                  hintText: 'Last Name',
                  controller: TextEditingController(),
                  obsecure: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: AppTextField(
                  hintText: 'Mobile',
                  controller: TextEditingController(),
                  obsecure: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: AppTextField(
                  hintText: 'Password',
                  controller: TextEditingController(),
                  obsecure: true,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              AppElevatedButton(
                onTap: () {},
                child: const Icon(Icons.arrow_circle_right_outlined),
              ),
              AppTextButton(
                child: Text('Have Account ?'),
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'Sign In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
