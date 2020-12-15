import 'package:cookie/models/sweets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = '/details';
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class SweetsDetailsArguments {
  final Sweets allSweets;

  SweetsDetailsArguments({@required this.allSweets});
}
