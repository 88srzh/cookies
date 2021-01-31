import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/dindon/components/body_dindon.dart';
import 'package:flutter/material.dart';

class DindonScreen extends StatelessWidget {
  static String routeName = '/dindondetails';
  @override
  Widget build(BuildContext context) {
    final AllSweetsDetailsArguments allarguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
      body: BodyDindonScreen(allSweets: allarguments.allSweets),
    );
  }
}

class AllSweetsDetailsArguments {
  final Sweets allSweets;

  AllSweetsDetailsArguments({@required this.allSweets});
}