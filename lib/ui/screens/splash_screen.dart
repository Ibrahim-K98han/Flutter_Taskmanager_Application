import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../style/text_style.dart';
import '../widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
