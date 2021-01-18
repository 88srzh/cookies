import 'package:cookie/screens/settings/components/body_settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: BodySettingsScreen(),
    );
  }
}
