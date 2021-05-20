// import 'package:cookie/database/firestore_crud_page.dart';
import 'package:cookie/screens/home/home_screen.dart';
import 'package:cookie/screens/sign_in/components/body_sign_in.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = '/signinnew';
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
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(child: BodySignIn()),
      );
    }
    return HomeScreen();
  }
}
