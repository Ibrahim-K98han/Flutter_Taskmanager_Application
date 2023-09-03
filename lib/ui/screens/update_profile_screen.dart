import 'package:flutter/material.dart';
import 'package:taskmanager/ui/widgets/app_elevated_button.dart';

import '../../style/text_style.dart';
import '../widgets/app_text_filed.dart';
import '../widgets/screen_background.dart';
import '../widgets/user_profile_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreen();
}

class _UpdateProfileScreen extends State<UpdateProfileScreen> {
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
                      'Update Profile',
                      style: Head1Text,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child: const Text('Photo'),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: const Text(''),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AppTextField(
                      controller: TextEditingController(),
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextField(
                      controller: TextEditingController(),
                      hintText: 'First Name',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextField(
                      controller: TextEditingController(),
                      hintText: 'Last Name',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextField(
                      controller: TextEditingController(),
                      hintText: 'Mobile',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextField(
                      controller: TextEditingController(),
                      hintText: 'Password',
                      //obsecureText: true,
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
