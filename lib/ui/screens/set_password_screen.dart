import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/login_screen.dart';
import '../../style/text_style.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_button.dart';
import '../widgets/app_text_filed.dart';
import '../widgets/screen_background.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
                'Set Password',
                style: Head1Text,
              ),
              Text(
                'Minimum length of password must be 6 with letters and nuber combination',
                style: Head15Text,
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextField(
                hintText: 'Password',
                controller: TextEditingController(),
                obsecure: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: AppTextField(
                  hintText: 'Confirm Password',
                  controller: TextEditingController(),
                  obsecure: true,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              AppElevatedButton(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                },
                child: const Text('Confirm'),
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextButton(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                },
                text: 'Sign In',
                child: const Text('Have account? '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
