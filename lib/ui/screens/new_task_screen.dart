import 'package:flutter/material.dart';
import '../widgets/dashboard_item_widget.dart';
import '../widgets/screen_background.dart';
import '../widgets/task_list_item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroun(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DashboardItemWidget(
                    numberOfTask: 12,
                    typeOfTask: 'New',
                  ),
                ),
                Expanded(
                  child: DashboardItemWidget(
                    numberOfTask: 12,
                    typeOfTask: 'Progress',
                  ),
                ),
                Expanded(
                  child: DashboardItemWidget(
                    numberOfTask: 12,
                    typeOfTask: 'Completed',
                  ),
                ),
                Expanded(
                  child: DashboardItemWidget(
                    numberOfTask: 12,
                    typeOfTask: 'Canceled',
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TaskListItem(
                    subject: 'Hello',
                    description: 'lorem Ipsum Dolder side',
                    date: '31/08/2023',
                    type: 'New',
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

