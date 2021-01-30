import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/screens/sign_in/components/body_sign_in_new.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cookie/screens/sign_in/sign_in_example.dart';
import 'package:flutter/material.dart';

class SignInScreenNew extends StatefulWidget {
  static String routeName = '/signinnew';
  @override
  _SignInScreenNewState createState() => _SignInScreenNewState();
}

class _SignInScreenNewState extends State<SignInScreenNew> {
  User user;
  onRefresh(userCredential) {
    setState(() {
      user = userCredential;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: BodySignInNew(
            onSignInAnonymous: (userCredential) => onRefresh(userCredential),
          ),

          // child: SignInScreenNew()
        ),
      );
    }
    return DindonMainScreen();
  }
}
