// import 'dart:async';

// import 'package:cookie/controller/user_controller.dart';
// import 'package:cookie/locator.dart';
// import 'package:cookie/screens/home/home_screen.dart';
// import 'package:flutter/material.dart';

// class VerifyScreen extends StatefulWidget {
//   static String routeName = '/verify-screen';

//   @override
//   _VerifyScreenState createState() => _VerifyScreenState();
// }

// class _VerifyScreenState extends State<VerifyScreen> {
//   Timer timer;
//   var userController = locator.get<UserController>();

//   @override
//   void initState() {
//     userController.sendEmailVerification();

//     timer = Timer.periodic(Duration(seconds: 5), (timer) {});
//     if (userController.checkEmailVerified() != null) {
//       timer.cancel();
//       Navigator.pushNamed(context, HomeScreen.routeName);
//     }

//     super.initState();
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text('На вашу почту было отправлено письмо'),)
//     );
//   }
// }
