import 'package:flutter/material.dart';
import 'package:taskmanager/ui/widgets/app_elevated_button.dart';

import '../../style/text_style.dart';
import '../widgets/app_text_filed.dart';
import '../widgets/screen_background.dart';
import '../widgets/user_profile_widget.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackgroun(
            child: Column(
          children: [
            const UserProfileWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add New Task',
                      style: Head1Text,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AppTextField(
                      controller: TextEditingController(),
                      hintText: 'Subject',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextField(
                      controller: TextEditingController(),
                      hintText: 'Description',
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AppElevatedButton(
                        child: Icon(Icons.arrow_circle_right_outlined),
                        onTap: () {})
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
