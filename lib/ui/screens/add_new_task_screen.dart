import 'package:flutter/material.dart';
import 'package:taskmanager/data/auth_utils.dart';
import 'package:taskmanager/data/network_utils.dart';
import 'package:taskmanager/data/urls.dart';
import 'package:taskmanager/ui/widgets/app_elevated_button.dart';
import 'package:taskmanager/ui/widgets/snackba_message.dart';

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
  final TextEditingController subjectETController = TextEditingController();
  final TextEditingController descriptionETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackgroun(
            child: Form(
          key: _formKey,
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
                        controller: subjectETController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Subject';
                          }
                          return null;
                        },
                        hintText: 'Subject',
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextField(
                        controller: descriptionETController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Description';
                          }
                          return null;
                        },
                        hintText: 'Description',
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      _inProgress == true
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            )
                          : AppElevatedButton(
                              child:
                                  const Icon(Icons.arrow_circle_right_outlined),
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  _inProgress = true;
                                  setState(() {});
                                  final result = await NetworkUtils()
                                      .postMethod(Urls.createNewTaskUrl, body: {
                                    "title": subjectETController.text.trim(),
                                    "description":
                                        descriptionETController.text.trim(),
                                    "status": "New"
                                  });
                                  _inProgress = false;
                                  setState(() {});
                                  print(result);
                                  if (result != null &&
                                      result['status'] == 'success') {
                                    subjectETController.clear();
                                    descriptionETController.clear();
                                    showSnackBarMessage(
                                        context, 'New Task Added Successfully');
                                  } else {
                                    showSnackBarMessage(context,
                                        'New Task Add Failed! Try Again', true);
                                  }
                                }
                              })
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
