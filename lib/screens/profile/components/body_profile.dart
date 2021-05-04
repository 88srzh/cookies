import 'package:cookie/screens/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cookie/components/custom_settings_divider.dart';
import 'package:cookie/screens/settings/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BodyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
      ),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          CustomSettingsDivider(),
          ListTile(
            onTap: () {},
            leading: Icon(FontAwesomeIcons.solidUser),
            // title: Text(user.displayName),
            title: Text('Мой профиль'),
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
            title: Text(currentUser.email, style: TextStyle(color: Colors.black87),),
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
