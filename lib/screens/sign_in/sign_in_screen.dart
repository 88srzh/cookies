import 'package:flutter/material.dart';
import 'components/body_sign_in.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/sign_in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Войти'),
          ),
      body: BodySignIn(),
    );
  }
}
