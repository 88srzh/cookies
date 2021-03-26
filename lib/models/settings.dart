import 'package:flutter/material.dart';

class SettingsItem with ChangeNotifier {
  bool notifications;
  bool fingerprint;

  SettingsItem({this.notifications, this.fingerprint});
}
