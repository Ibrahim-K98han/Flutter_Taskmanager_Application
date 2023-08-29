import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/canceled_task_screen.dart';
import 'package:taskmanager/ui/screens/completed_task_screen.dart';
import 'package:taskmanager/ui/screens/inprogress_task_screen.dart';
import 'package:taskmanager/ui/screens/new_task_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int selectedIndex = 0;
  final List<Widget> screen = [
    NewTaskScreen(),
    InprogressTaskScreen(),
    CompletedTaskScreen(),
    CanceledTaskScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black38,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        elevation: 5,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined), label: 'New'),
          BottomNavigationBarItem(
              icon: Icon(Icons.watch_later_outlined), label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cancel_outlined), label: 'Cancel'),
        ],
      ),
    );
  }
}
