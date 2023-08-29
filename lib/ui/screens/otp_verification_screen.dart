import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/ui/screens/login_screen.dart';
import 'package:taskmanager/ui/screens/set_password_screen.dart';
import '../../style/text_style.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_button.dart';
import '../widgets/screen_background.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
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
                'Pin Verification',
                style: Head1Text,
              ),
              Text(
                'A 6 digits verification pin will be sent to your email address ',
                style: Head15Text,
              ),
              const SizedBox(
                height: 24,
              ),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(4),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedColor: Colors.green,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                onCompleted: (v) {},
                onChanged: (value) {
                  print(value);
                  setState(() {});
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");

                  return true;
                },
                appContext: context,
              ),
              const SizedBox(
                height: 24,
              ),
              AppElevatedButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SetPasswordScreen(),
                    ),
                  );
                },
                child: const Text('Verifiy'),
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
