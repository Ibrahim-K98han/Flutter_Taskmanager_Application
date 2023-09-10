import 'package:flutter/material.dart';
import 'package:taskmanager/data/auth_utils.dart';
import 'package:taskmanager/ui/screens/login_screen.dart';
import 'package:taskmanager/ui/screens/update_profile_screen.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UpdateProfileScreen(),
            ));
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      tileColor: Colors.green,
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text('${AuthUtils.firstName ?? ''} ${AuthUtils.lastName ?? ''}'),
      subtitle: Text(AuthUtils.email ?? ''),
      trailing: IconButton(
        onPressed: () async {
          await AuthUtils.clearData();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ), (route) => false);
        },
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }
}
