import 'package:cookie/components/custom_settings_divider.dart';
import 'package:flutter/material.dart';

class OthersCard extends StatelessWidget {
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
            leading: Icon(Icons.description),
            title: Text('Пользовательское соглашение'),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey[300],
            ),
          ),
          CustomSettingsDivider(),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.collections_bookmark),
            title: Text('Лицензия'),
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
