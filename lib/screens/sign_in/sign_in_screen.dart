import 'package:cookie/screens/home/home_screen.dart';
// import 'package:cookie/screens/sign_in/components/body_sign_in.dart';
import 'package:cookie/screens/sign_in/components/body_sign_in_new.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = '/signInNew';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  User user;
  @override
  void initState() {
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(userCredential) {
    setState(() {
      user = userCredential;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (user == null) {
      return Scaffold(
        body: BodySignInScreenNew(),
      );
    }
    return HomeScreen();
  }
}
