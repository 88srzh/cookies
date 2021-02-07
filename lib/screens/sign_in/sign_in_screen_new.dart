// import 'package:cookie/database/firestore_crud_page.dart';
import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:cookie/screens/sign_in/components/body_sign_in_new.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreenNew extends StatefulWidget {
  static String routeName = '/signinnew';
  @override
  _SignInScreenNewState createState() => _SignInScreenNewState();
}

class _SignInScreenNewState extends State<SignInScreenNew> {
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
        backgroundColor: Colors.transparent,
        body: BodySignInNew(),
      );
    }
    return DindonMainScreen();
  }
}
