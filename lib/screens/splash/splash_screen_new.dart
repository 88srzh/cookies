import 'package:cookie/screens/splash/components/splash_screen_new_body.dart';
import 'package:cookie/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreenNew extends StatelessWidget {
  final Firebase app;
  static String routeName = '/splashScreenNew';
  const SplashScreenNew({Key key, this.app});
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: SplashScreenNewBody(),
    );
  }
}
