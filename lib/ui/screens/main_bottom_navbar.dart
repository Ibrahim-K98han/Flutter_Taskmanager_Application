import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/add_new_task_screen.dart';
import 'package:taskmanager/ui/screens/canceled_task_screen.dart';
import 'package:taskmanager/ui/screens/completed_task_screen.dart';
import 'package:taskmanager/ui/screens/inprogress_task_screen.dart';
import 'package:taskmanager/ui/screens/new_task_screen.dart';

import '../widgets/user_profile_widget.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int selectedIndex = 0;
  final List<Widget> screen = const [
    NewTaskScreen(),
    InprogressTaskScreen(),
    CompletedTaskScreen(),
    CanceledTaskScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileWidget(),
            Expanded(child: screen[selectedIndex]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewTaskScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
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
