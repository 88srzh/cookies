// import 'package:cookie/screens/profile/components/profile_menu.dart';
import 'package:cookie/screens/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cookie/components/custom_settings_divider.dart';
import 'package:cookie/screens/settings/settings_screen.dart';

class BodyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))),
      margin: EdgeInsets.all(0),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          CustomSettingsDivider(),
          ListTile(
            onTap: () {},
            leading: Icon(FontAwesomeIcons.solidUser),
            title: Text(user.displayName),
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
            title: Text(user.email),
            enabled: false,
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey[300],
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
