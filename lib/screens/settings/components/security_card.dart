import 'package:cookie/models/settings.dart';
import 'package:flutter/material.dart';

import 'package:cookie/components/custom_settings_divider.dart';
import 'package:provider/provider.dart';

class SecurityCard extends StatefulWidget {
  // const ToggleOnCard({this.text, this.icon, this.press});
  // final String text;
  // final Icon iconFirst, iconSecond;
  // final Function press;
  @override
  _SecurityCardState createState() => _SecurityCardState();
}

class _SecurityCardState extends State<SecurityCard> {
  @override
  Widget build(BuildContext context) {
    // final settings = Provider.of<SettingsItem>(context, listen: false);
    bool _toggled = false;
    bool value1 = false;
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
      // ),
      child: Column(
        children: [
          // SwitchListTile(
          //   value: true,
          //   onChanged: (value) {},
          //   // leading: Icon(Icons.fingerprint),
          //   secondary: Icon(Icons.fingerprint),
          //   title: Text('Отпечаток пальца'),
          //   activeColor: Colors.red[300],
          //   // trailing: Container(
          //   //   child: Container(
          //   //     child: Icon(
          //   //       Icons.toggle_on,
          //   //       size: 60,
          //   //       color: Colors.red,
          //   //     ),
          //   //   ),
          // ),
          CustomSettingsDivider(),
          buildSwetchListTile(
              title: 'Получать уведомления',
              value: value1,
              onChanged: (val) => setState(() => value1 = val)),
          // SwitchListTile(
          //   value: _toggled,
          //   onChanged: (bool value) {
          //     setState(() => _toggled = value);
          //   },
          //   title: Text('Получать уведомления'),
          //   activeColor: Colors.red[300],
          //   secondary: Icon(Icons.notifications_active),
          // ),
          CustomSettingsDivider(),
          // SwitchListTile(
          //   onChanged: (value) {},
          //   value: true,
          //   // leading: Icon(Icons.http),
          //   title: Text('Сменить пароль'),
          //   secondary: Icon(Icons.https),
          //   activeColor: Colors.red[300],
          // ),
        ],
      ),
    );
  }

  SwitchListTile buildSwetchListTile({
    String title,
    bool value,
    void Function(bool) onChanged,
  }) {
    return SwitchListTile(
        title: Text(title), value: value, onChanged: onChanged);
  }

  // void tapNotifications() {
  //   final settings = Provider.of<SettingsItem>(context, listen: false);
  //   setState(() {
  //     if (settings.notifications) {
  //       settings.notifications = false;
  //     } else {
  //       settings.notifications = true;
  //     }
  //   });
  // }
}
