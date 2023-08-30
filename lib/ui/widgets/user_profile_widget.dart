import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      tileColor: Colors.green,
      leading: CircleAvatar(child: Icon(Icons.person)),
      title: Text('Ibrahim Khan'),
      subtitle: Text('ibrahim@gmail.com'),
    );
  }
}