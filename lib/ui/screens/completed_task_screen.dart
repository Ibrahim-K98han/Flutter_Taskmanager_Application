import 'package:flutter/material.dart';
import 'package:taskmanager/ui/widgets/status_change_bottom_sheet.dart';
import '../../data/models/task_model.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import '../widgets/dashboard_item_widget.dart';
import '../widgets/screen_background.dart';
import '../widgets/snackba_message.dart';
import '../widgets/task_list_item.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  TaskModel completedTaskModel = TaskModel();
  bool inProgress = false;
  @override
  void initState() {
    getAllCompletedTasks();
    super.initState();
  }

  Future<void> getAllCompletedTasks() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
      Urls.completedTaskUrl,
    );
    if (response != null) {
      completedTaskModel = TaskModel.fromJson(response);
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
                        await getAllCompletedTasks();
                      },
                      child: ListView.builder(
                        itemCount: completedTaskModel.data!.length,
                        itemBuilder: (context, index) {
                          return TaskListItem(
                            type: 'Completed',
                            date: completedTaskModel.data![index].createdDate ??
                                'Unknown',
                            description:
                                completedTaskModel.data![index].description ??
                                    'Unknown',
                            subject: completedTaskModel.data![index].title ??
                                'Unknown',
                            onDeletePress: () {},
                            onEditPress: () {
                              showChangeTaskStatus('Completed',
                                  completedTaskModel.data![index].sId ?? '',
                                  () {
                                getAllCompletedTasks();
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
