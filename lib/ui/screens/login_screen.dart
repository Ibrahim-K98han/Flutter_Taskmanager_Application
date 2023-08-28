import 'package:flutter/material.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';
import '../../style/text_style.dart';
import '../widgets/app_elevated_button.dart';
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
        widget: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get Started With',
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
                  hintText: 'Password',
                  controller: TextEditingController(),
                  obsecure: true,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              AppElevatedButton(
                onTap: () {},
                child: const Icon(Icons.arrow_circle_right_outlined),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password ?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t Have an account? '),
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
