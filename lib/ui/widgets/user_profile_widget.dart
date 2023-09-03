import 'package:flutter/material.dart';
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
      title: Text('Ibrahim Khan'),
      subtitle: Text('ibrahim@gmail.com'),
    );
  }
}
