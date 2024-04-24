import 'package:flutter/material.dart';

import '../utils/navigator_service.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions:[
      IconButton(
      icon:  Icon(Icons.arrow_back),
      tooltip: 'Edit Profile',
      onPressed: () {
        NavigatorService.goBack();
      },
      ),
    ]),
          body:Container(),
    );
  }
}
