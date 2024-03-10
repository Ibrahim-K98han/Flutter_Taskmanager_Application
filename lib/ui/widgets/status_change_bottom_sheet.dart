import 'package:flutter/material.dart';
import 'package:taskmanager/app.dart';
import 'package:taskmanager/ui/widgets/snackba_message.dart';
import '../../data/network_utils.dart';
import '../../data/urls.dart';
import 'app_elevated_button.dart';

showChangeTaskStatus(
    String currentStatus, String taskId, VoidCallback onTaskChangeCompleted) {
  String statusValue = currentStatus;
  showModalBottomSheet(
    context: TaskManagerApp.globalKey.currentContext!,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Column(
            children: [
              RadioListTile(
                value: 'New',
                title: const Text(
                  'New',
                ),
                groupValue: statusValue,
                onChanged: (state) {
                  statusValue = state!;
                  setState(() {});
                },
              ),
              RadioListTile(
                value: 'Completed',
                title: const Text(
                  'Completed',
                ),
                groupValue: statusValue,
                onChanged: (state) {
                  statusValue = state!;
                  setState(() {});
                },
              ),
              RadioListTile(
                value: 'Progress',
                title: const Text(
                  'Progress',
                ),
                groupValue: statusValue,
                onChanged: (state) {
                  statusValue = state!;
                  setState(() {});
                },
              ),
              RadioListTile(
                value: 'Canceled',
                title: const Text(
                  'Canceled',
                ),
                groupValue: statusValue,
                onChanged: (state) {
                  statusValue = state!;
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppElevatedButton(
                    child: const Text('Change Status'),
                    onTap: () async {
                      final response = await NetworkUtils().getMethod(
                          Urls.changeTaskStatus(taskId, statusValue));
                      if (response != null) {
                        onTaskChangeCompleted();
                        Navigator.pop(context);
                      } else {
                        showSnackBarMessage(
                            context, 'Status Change failed! try again', true);
                      }
                    }),
              )
            ],
          );
        },
      );
    },
  );
}
