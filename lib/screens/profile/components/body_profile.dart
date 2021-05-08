// import 'dart:io';

import 'dart:io';

import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
import 'package:cookie/screens/profile/components/avatar.dart';
// import 'package:cookie/screens/profile/components/avatar.dart';
// import 'package:cookie/screens/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cookie/components/custom_settings_divider.dart';
import 'package:cookie/screens/settings/settings_screen.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';

class BodyProfile extends StatefulWidget {
  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  @override
  Widget build(BuildContext context) {
    UserModel _currentUser = locator.get<UserController>().currentUser;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
      ),
      child: Column(
        children: [
          Avatar(
            avatarUrl: _currentUser?.avatarUrl,
            onTap: () async {
              PickedFile pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
              File image = File(pickedImage.path);
              await locator.get<UserController>().uploadProfilePicture(image);
              setState(() {});
            },
          ),
          Text('\nПривет ${_currentUser.displayName}', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          SizedBox(height: 20),
          CustomSettingsDivider(),
          ListTile(
            onTap: () {},
            leading: Icon(FontAwesomeIcons.solidUser),
            title: Text('hi ${_currentUser?.displayName}'),
            enabled: false,
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey[300],
            ),
          ),
          CustomSettingsDivider(),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.mail),
            // ! fix user email
            title: Text('${_currentUser?.email}'),
            enabled: false,
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black54,
            ),
          ),
          CustomSettingsDivider(),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, SettingsScreen.routeName);
            },
            leading: Icon(FontAwesomeIcons.cog),
            title: Text('Настройки'),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey[300],
            ),
          ),
          CustomSettingsDivider(),
          ListTile(
            onTap: () {},
            leading: Icon(FontAwesomeIcons.question),
            title: Text('Помощь'),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey[300],
            ),
          ),
          CustomSettingsDivider(),
          ListTile(
            onTap: () {
              // ! fix logout
            },
            leading: Icon(Icons.exit_to_app),
            title: Text('Выйти'),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey[300],
            ),
          ),
          CustomSettingsDivider(),
        ],
      ),
    );
  }
}
