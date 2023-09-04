import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/login_screen.dart';
import '../../style/text_style.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_button.dart';
import '../widgets/app_text_filed.dart';
import '../widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailETController = TextEditingController();
  final TextEditingController firstNameETController = TextEditingController();
  final TextEditingController lastNameETController = TextEditingController();
  final TextEditingController mobileETController = TextEditingController();
  final TextEditingController passwordETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroun(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Join With US',
                  style: Head1Text,
                ),
                const SizedBox(
                  height: 24,
                ),
                AppTextField(
                  controller: emailETController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                  hintText: 'Email',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppTextField(
                    hintText: 'First Name',
                    controller: TextEditingController(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppTextField(
                    hintText: 'Last Name',
                    controller: TextEditingController(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppTextField(
                    hintText: 'Mobile',
                    controller: TextEditingController(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppTextField(
                    hintText: 'Password',
                    controller: TextEditingController(),
                    // obsecure: true,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                AppElevatedButton(
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      
                    }
                  },
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
                AppTextButton(
                  onTap: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  text: 'Sign In',
                  child: const Text('Have Account ?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
