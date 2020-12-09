import 'package:cookie/screens/forgot_password/components/body_forgot_password.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = '/forgot_password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Забыли пароль'),
      ),
      body: BodyForgotPassword(),
    );
  }
}
