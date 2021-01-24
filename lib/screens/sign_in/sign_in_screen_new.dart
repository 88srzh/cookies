import 'package:cookie/screens/sign_in/components/body_sign_in_new.dart';
import 'package:cookie/screens/sign_in/sign_in_example.dart';
import 'package:flutter/material.dart';

class SignInScreenNew extends StatelessWidget {
  static String routeName = '/signinnew';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        // child: BodySignInNew(),
        child: SignInPage(),
      ),
    );
  }
}
