import 'package:cookie/screens/forgot_password/components/body_forgot_password2.dart';
import 'package:flutter/material.dart';

class ForgotPassword2 extends StatelessWidget {
  static String routeName = '/forgotPassword2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Забыли пароль?'),
      ),
      body: BodyForgotPassword2(),
    );
  }
}
