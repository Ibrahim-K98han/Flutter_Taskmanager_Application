import 'package:flutter/material.dart';

import '../widgets/screen_background.dart';
import '../widgets/task_list_item.dart';

class InprogressTaskScreen extends StatefulWidget {
  const InprogressTaskScreen({super.key});

  @override
  State<InprogressTaskScreen> createState() => _InprogressTaskScreenState();
}

class _InprogressTaskScreenState extends State<InprogressTaskScreen> {
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
                    type: 'InProgress',
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
