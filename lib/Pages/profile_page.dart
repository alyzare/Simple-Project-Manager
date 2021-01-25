import 'package:flutter/material.dart';
import 'package:my_todo/models/Profile.dart';

class ProfilePage extends StatelessWidget {
  Profile _currentProfile;

  ProfilePage(Profile profile) {
    _currentProfile = profile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Name: ${_currentProfile.name}'),
          ],
        ),
      ),
    );
  }
}
