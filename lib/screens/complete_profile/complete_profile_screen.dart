import 'package:cookie/screens/complete_profile/body_complete_profile.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = '/complete_profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Зарегистрироваться'),
      ),
      body: BodyCompleteProfile(),
    );
  }
}
