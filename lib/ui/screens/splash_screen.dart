import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskmanager/style/colors.dart';

import '../../style/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            color: colorGreen.withOpacity(.2),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/lotti/task_lottie.json', width: 200),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  'Task Manager',
                  style: Head1Text(colorDarkBlue),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
