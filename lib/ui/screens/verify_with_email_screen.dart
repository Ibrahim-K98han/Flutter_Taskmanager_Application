import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/otp_verification_screen.dart';
import 'package:taskmanager/ui/screens/sign_up_screen.dart';

import '../../style/text_style.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_button.dart';
import '../widgets/app_text_filed.dart';
import '../widgets/screen_background.dart';

class VerifyWithEmailScreen extends StatefulWidget {
  const VerifyWithEmailScreen({super.key});

  @override
  State<VerifyWithEmailScreen> createState() => _VerifyWithEmailScreenState();
}

class _VerifyWithEmailScreenState extends State<VerifyWithEmailScreen> {
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
                'Your Email Address',
                style: Head1Text,
              ),
              Text(
                'A 6 digits verification pin will be sent to your email address ',
                style: Head15Text,
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextField(
                controller: TextEditingController(),
                hintText: 'Email',
              ),
              const SizedBox(
                height: 16,
              ),
              AppElevatedButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OTPVerificationScreen(),
                    ),
                  );
                },
                child: const Icon(Icons.arrow_circle_right_outlined),
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                text: 'Sign Up',
                child: const Text('Have account? '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
