import 'package:flutter/material.dart';

import '../../style/text_style.dart';

class DashboardItemWidget extends StatelessWidget {
  DashboardItemWidget({
    super.key,
    required this.numberOfTask,
    required this.typeOfTask,
  });

  final int numberOfTask;
  final String typeOfTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          border: Border.all(color: Colors.green, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                numberOfTask.toString(),
                style: Head24Text,
              ),
              const SizedBox(
                height: 4,
              ),
              FittedBox(
                child: Text(
                  typeOfTask,
                  style: Head15Text.copyWith(color: Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
