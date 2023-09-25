import 'package:flutter/material.dart';
import 'package:taskmanager/data/models/task_model.dart';
import 'package:taskmanager/data/network_utils.dart';
import 'package:taskmanager/data/urls.dart';
import 'package:taskmanager/ui/widgets/snackba_message.dart';
import '../widgets/dashboard_item_widget.dart';
import '../widgets/screen_background.dart';
import '../widgets/status_change_bottom_sheet.dart';
import '../widgets/task_list_item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TaskModel newTaskModel = TaskModel();
  bool inProgress = false;
  @override
  void initState() {
    getAllNewTasks();
    super.initState();
  }

  Future<void> getAllNewTasks() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
      Urls.newTaskUrl,
    );
    if (response != null) {
      newTaskModel = TaskModel.fromJson(response);
    } else {
      showSnackBarMessage(context, 'Unable to fetch new task! try again', true);
    }
    inProgress = false;
    setState(() {});
  }

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
              child: inProgress
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        await getAllNewTasks();
                      },
                      child: ListView.builder(
                        itemCount: newTaskModel.data!.length,
                        // reverse: true,
                        itemBuilder: (context, index) {
                          return TaskListItem(
                            type: 'New',
                            date: newTaskModel.data![index].createdDate ??
                                'Unknown',
                            description:
                                newTaskModel.data![index].description ??
                                    'Unknown',
                            subject:
                                newTaskModel.data![index].title ?? 'Unknown',
                            onDeletePress: () {},
                            onEditPress: () {
                              showChangeTaskStatus(
                                  'New', newTaskModel.data![index].sId ?? '',
                                  () {
                                getAllNewTasks();
                              });
                            },
                          );
                        },
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
