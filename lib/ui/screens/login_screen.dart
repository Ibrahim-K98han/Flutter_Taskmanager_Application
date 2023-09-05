import 'package:flutter/material.dart';
import 'package:taskmanager/data/network_utils.dart';
import 'package:taskmanager/data/urls.dart';
import 'package:taskmanager/ui/screens/main_bottom_navbar.dart';
import 'package:taskmanager/ui/screens/sign_up_screen.dart';
import 'package:taskmanager/ui/screens/verify_with_email_screen.dart';
import 'package:taskmanager/ui/widgets/screen_background.dart';
import 'package:taskmanager/ui/widgets/snackba_message.dart';
import '../../style/text_style.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text_button.dart';
import '../widgets/app_text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();
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
                  controller: _emailETController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your valid email';
                    }
                    return null;
                  },
                  hintText: 'Email',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: AppTextField(
                    hintText: 'Password',
                    controller: _passwordETController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your valid Password';
                      }
                      return null;
                    },
                    obsecureText: true,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                AppElevatedButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final result =
                          await NetworkUtils().postMethod(Urls.loginUrl, body: {
                        'email': _emailETController.text.trim(),
                        'password': _passwordETController.text,
                      }, onUnAuthorize: () {
                        showSnackBarMessage(
                            context, 'User Name or password incorrect', true);
                      });

                      if (result != null && result['status'] == 'success') {
                        _emailETController.clear();
                        _passwordETController.clear();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainBottomNavBar(),
                            ),
                            (route) => false);
                        showSnackBarMessage(context, 'Login Success');
                      } else {
                        showSnackBarMessage(
                            context, 'Login Failed! try again', true);
                      }
                    }
                  },
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VerifyWithEmailScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
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
                  child: const Text('Don\'t Have an account? '),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
