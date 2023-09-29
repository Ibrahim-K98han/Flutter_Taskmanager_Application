import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskmanager/data/auth_utils.dart';
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
  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _firstETController = TextEditingController();
  final TextEditingController _lastETController = TextEditingController();
  final TextEditingController _mobileETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();
  XFile? pickedImage;

  @override
  void initState() {
    _emailETController.text = AuthUtils.email ?? '';
    _firstETController.text = AuthUtils.firstName ?? '';
    _lastETController.text = AuthUtils.lastName ?? '';
    _mobileETController.text = AuthUtils.mobile ?? '';
    super.initState();
  }

  void pickImage() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick Image form'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () async {
                  pickedImage =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    setState(() {});
                  }
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
              ),
              ListTile(
                onTap: () async {
                  pickedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {});
                  }
                },
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
              )
            ],
          ),
        );
      },
    );
  }

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
                      onTap: () {
                        pickImage();
                      },
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
                              child: Text(
                                pickedImage?.name ?? '',
                                maxLines: 1,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AppTextField(
                      controller: _emailETController,
                      readOnly: true,
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextField(
                      controller: _firstETController,
                      hintText: 'First Name',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextField(
                      controller: _lastETController,
                      hintText: 'Last Name',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AppTextField(
                      controller: _mobileETController,
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
