import 'package:cookie/screens/settings/components/body_settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BodySettingsScreen(),
    );
  }
}
