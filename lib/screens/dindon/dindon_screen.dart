import 'package:cookie/screens/dindon/components/body_dindon.dart';
import 'package:flutter/material.dart';

class DindonScreen extends StatelessWidget {
  static String routeName = '/dindon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
      body: SingleChildScrollView(child: BodyDindonScreen()),
    );
  }
}
