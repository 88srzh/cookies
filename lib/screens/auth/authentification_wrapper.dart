import 'package:cookie/screens/home/home_screen.dart';
import 'package:cookie/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthentificationWrapper extends StatelessWidget {
  static String routeName = '/authWrapper';

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeScreen();
    }
    return SignInScreen();
  }
}
