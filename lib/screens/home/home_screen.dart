import 'package:cookie/screens/home/components/body_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyHome(),
    );
  }
}
