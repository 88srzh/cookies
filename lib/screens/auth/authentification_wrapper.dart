import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/screens/sign_in/sign_in_screen_new.dart';
import 'package:cookie/screens/sign_up/components/sign_up_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthentificationWrapper extends StatelessWidget {
  static String routeName = '/authWrapper';

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return DindonMainScreen();
    }
    return SignInScreenNew();
  }
}
