import 'dart:io';

import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
import 'package:cookie/screens/profile/components/avatar.dart';
import 'package:cookie/screens/profile/components/manage_profile_info.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  static String routeName = '/profile-view';

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  UserModel _currentUser = locator.get<UserController>().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Avatar(
                   avatarUrl: _currentUser?.avatarUrl,
            onTap: () async {
              PickedFile pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
              var image = File(pickedImage.path);
              await locator.get<UserController>().uploadProfilePicture(image);
                      setState(() {});
                    },
                  ),
                  Text('Привет ${_currentUser.displayName},\n забыли пароль?', style: TextStyle(), textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ManageProfileInformationWidget(
              currentUser: _currentUser,
            ),
          )
        ],
      ),
    );
  }
}