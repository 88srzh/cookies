// import 'dart:io';

import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
// import 'package:cookie/screens/profile/components/avatar.dart';
// import 'package:cookie/screens/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cookie/components/custom_settings_divider.dart';
import 'package:cookie/screens/settings/settings_screen.dart';
// import 'package:image_picker/image_picker.dart';

class BodyProfile extends StatefulWidget {
  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  UserModel currentUser = locator.get<UserController>().currentUser;

  @override
  Widget build(BuildContext context) {
    // var currentUser = FirebaseAuth.instance.currentUser;
    // var image;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
      ),
      child: Column(
        children: [
          // ! fix profile avatar
          // ProfilePic(),
          // Avatar(
          //   avatarUrl: currentUser?.avatarUrl,
          //   onTap: () async {
          //     PickedFile pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
          //     image = File(pickedImage.path);
          //     await locator.get<UserController>().uploadProfilePicture(image);
          //   },
          // ),
          SizedBox(height: 20),
          CustomSettingsDivider(),
          ListTile(
            onTap: () {},
            leading: Icon(FontAwesomeIcons.solidUser),
            // title: Text(user.displayName),
            title: Text('hi ${currentUser?.displayName}'),
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
            // title: Text(currentUser.email, style: TextStyle(color: Colors.black87),),
            title: Text('email'),
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
            onTap: () {},
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
