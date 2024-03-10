import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskmanager/data/auth_utils.dart';
import 'package:taskmanager/ui/screens/login_screen.dart';
import 'package:taskmanager/ui/screens/main_bottom_navbar.dart';
import '../../data/utils/auth_utility.dart';
import '../../style/text_style.dart';
import '../widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 3)).then((value) {
    //   checkUserAuthState();
    // });
    navigateToLogin();
    super.initState();
  }

  // void checkUserAuthState() async {
  //   final bool result = await AuthUtils.checkLoginState();
  //   if (result) {
  //     await AuthUtils.getAuthData();
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
  //       builder: (context) {
  //         return MainBottomNavBar();
  //       },
  //     ), (route) => false);
  //   } else {
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
  //       builder: (context) {
  //         return LoginScreen();
  //       },
  //     ), (route) => false);
  //   }
  // }

  Future<void> navigateToLogin() async {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => isLoggedIn
                  ? const MainBottomNavBar()
                  : const LoginScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroun(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/lotti/task_lottie.json', width: 200),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  'Task Manager',
                  style: Head1Text,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
