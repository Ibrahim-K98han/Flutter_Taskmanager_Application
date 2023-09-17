import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/splash_screen.dart';

void main() {
  runApp(TaskManager());
}

class TaskManager extends StatefulWidget {
  TaskManager({super.key});
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskManager.globalKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
