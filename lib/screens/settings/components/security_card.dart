import 'package:flutter/material.dart';
import 'package:cookie/components/custom_settings_divider.dart';

class SecurityCard extends StatefulWidget {
  // const ToggleOnCard({this.text, this.icon, this.press});
  // final String text;
  // final Icon iconFirst, iconSecond;
  // final Function press;
  @override
  _SecurityCardState createState() => _SecurityCardState();
}

class _SecurityCardState extends State<SecurityCard> {
  bool _tapFingerprin = false;
  bool _tapNotification = false;
  bool _tapPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
      // ),
      child: Column(
        children: [
          SwitchListTile(
            value: _tapFingerprin,
            onChanged: (tapFingerprint) {
              setState(() => _tapFingerprin = tapFingerprint);
            },
            // leading: Icon(Icons.fingerprint),
            secondary: Icon(Icons.fingerprint),
            title: Text('Отпечаток пальца'),
            activeColor: Colors.red[300],
          ),
          CustomSettingsDivider(),
          // buildSwetchListTile(
          //     title: 'Получать уведомления',
          //     value: value1,
          //     onChanged: (val) => setState(() => value1 = val)),
          SwitchListTile(
            value: _tapNotification,
            onChanged: (tapNotification) {
              setState(() => _tapNotification = tapNotification);
            },
            title: Text('Получать уведомления'),
            activeColor: Colors.red[300],
            secondary: Icon(Icons.notifications_active),
          ),
          CustomSettingsDivider(),
          SwitchListTile(
            value: _tapPassword,
            onChanged: (tapPassword) {
              setState(() => _tapPassword = tapPassword);
            },
            // leading: Icon(Icons.http),
            title: Text('Сменить пароль'),
            secondary: Icon(Icons.https),
            activeColor: Colors.red[300],
          ),
        ],
      ),
    );
  }

  // SwitchListTile buildSwetchListTile({
  //   String title,
  //   bool value,
  //   void Function(bool) onChanged,
  // }) {
  //   return SwitchListTile(
  //       title: Text(title), value: value, onChanged: onChanged);
  // }

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
