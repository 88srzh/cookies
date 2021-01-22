import 'package:cookie/screens/login_success/components/body_login_success.dart';
import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = '/login_success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          'Вход выполнен',
        ),
      ),
      body: BodyLoginSuccess(),
    );
  }
}
