import 'package:flutter/material.dart';
import 'package:taskmanager/style/text_style.dart';
import '../widgets/dashboard_item_widget.dart';
import '../widgets/screen_background.dart';

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        border: Border.all(color: Colors.green, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Title Here',
                            style: Head16Text,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Description Here'),
                          const SizedBox(
                            height: 4,
                          ),
                          Text('Date:30/8/2023'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Chip(
                                label: Text('New'),
                                backgroundColor: Colors.blue,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
