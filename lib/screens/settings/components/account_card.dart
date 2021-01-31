import 'package:cookie/components/custom_settings_divider.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))),
      margin: EdgeInsets.all(0),
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(Icons.call),
            title: Text('Номер телефона'),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey[300],
            ),
          ),
          CustomSettingsDivider(),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.mail),
            title: Text('Почта'),
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
        ],
      ),
    );
  }
}
