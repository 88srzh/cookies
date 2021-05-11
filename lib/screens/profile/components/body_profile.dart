// import 'dart:io';

import 'dart:io';

import 'package:cookie/controller/user_controller.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
import 'package:cookie/screens/profile/components/avatar.dart';
import 'package:cookie/screens/profile/components/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cookie/components/custom_settings_divider.dart';
import 'package:cookie/screens/settings/settings_screen.dart';
import 'package:image_picker/image_picker.dart';

import '../../sign_in/sign_in_screen.dart';

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
          CustomProfileListTile(
            icon: Icon(FontAwesomeIcons.solidUser, color: Colors.black54),
            title: 'Имя пользователя',
            subtitle: '${_currentUser?.displayName}',
          ),
          CustomSettingsDivider(),
          CustomProfileListTile(
            icon: Icon(Icons.mail, color: Colors.black54),
            title: 'Почта',
            subtitle: '${_currentUser?.email}',
          ),
          CustomSettingsDivider(),
          CustomProfileListTile(
            icon: Icon(
              Icons.email_outlined,
              color: Colors.black54,
            ),
            title: 'Телефон',
            subtitle: '${_currentUser.phoneNumber}',
          ),
          CustomSettingsDivider(),
          ListTile(
            onTap: () {Navigator.pushNamed(context, SettingsScreen.routeName);},
            leading: Icon(FontAwesomeIcons.cog),
            title: Text('Настройки'),
            trailing: Icon(Icons.keyboard_arrow_right),
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
            onTap: () async {
              var userController = locator.get<UserController>();
              userController.signOut();
              Navigator.pushNamed(context, SignInScreen.routeName);
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
