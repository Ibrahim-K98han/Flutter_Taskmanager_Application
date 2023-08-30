import 'package:flutter/material.dart';

import '../../style/text_style.dart';

class TaskListItem extends StatelessWidget {
  TaskListItem({
    super.key,
    required this.subject,
    required this.description,
    required this.date,
    required this.type,
    required this.onEditPress,
    required this.onDeletePress,
  });

  final String subject, description, date, type;
  final VoidCallback onEditPress, onDeletePress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        border: Border.all(color: Colors.green, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: Head16Text,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(description),
            const SizedBox(
              height: 4,
            ),
            Text('Date: $date'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Chip(
                    label: Text(
                      type,
                      style: Head12WithWhiteText,
                    ),
                    backgroundColor: Colors.blue,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: onEditPress,
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: onDeletePress,
                  icon: const Icon(Icons.delete),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
