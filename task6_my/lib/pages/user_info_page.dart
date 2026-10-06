import 'package:flutter/material.dart';

import '../model/user.dart';

class UserInfoPage extends StatelessWidget {

  final User userInfo;
  const UserInfoPage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Card(
          margin: const EdgeInsets.all(16.0),
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  userInfo.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(userInfo.story),
                leading: const Icon(
                  Icons.person,
                  color: Color(0xFF5B5BD6),
                ),
                trailing: Text(userInfo.country),
              ),
              ListTile(
                title: Text(
                  userInfo.phone,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: const Icon(
                  Icons.phone,
                  color: Color(0xFF5B5BD6),
                ),
              ),
              ListTile(
                title: Text(
                  userInfo.email.isEmpty ? 'Not specified' : userInfo.email,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: const Icon(
                  Icons.mail,
                  color: Color(0xFF5B5BD6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
