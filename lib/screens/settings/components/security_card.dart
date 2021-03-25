import 'package:cookie/components/custom_settings_divider.dart';
import 'package:flutter/material.dart';

class SecurityCard extends StatelessWidget {
  // const ToggleOnCard({this.text, this.icon, this.press});
  // final String text;
  // final Icon iconFirst, iconSecond;
  // final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(248, 219, 221, 1.0), Colors.orange[100]]),
      ),
      child: Column(
        children: [
          SwitchListTile(
            onChanged: (value) {},
            value: true,
            // leading: Icon(Icons.fingerprint),
            secondary: Icon(Icons.fingerprint),
            title: Text('Отпечаток пальца'),
            activeColor: Colors.red[100],
            // trailing: Container(
            //   child: Container(
            //     child: Icon(
            //       Icons.toggle_on,
            //       size: 60,
            //       color: Colors.red,
            //     ),
            //   ),
          ),
          CustomSettingsDivider(),
          SwitchListTile(
            value: false,
            onChanged: (value) {},
            title: Text('Получать уведомления'),
            secondary: Icon(Icons.notifications_active),
          ),
          CustomSettingsDivider(),
          SwitchListTile(
            onChanged: (value) {},
            value: true,
            // leading: Icon(Icons.http),
            title: Text('Сменить пароль'),
            secondary: Icon(Icons.https),
            activeColor: Colors.red[100],
          ),
        ],
      ),
    );
  }
}
