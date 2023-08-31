import 'package:flutter/material.dart';
import '../widgets/screen_background.dart';
import '../widgets/task_list_item.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroun(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TaskListItem(
                    subject: 'Hello',
                    description: 'lorem Ipsum Doler side',
                    date: '31/08/2023',
                    type: 'Completed',
                    onDeletePress: () {},
                    onEditPress: () {},
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
