import 'package:cookie/models/cart_new.dart';
import 'package:cookie/models/sweets.dart';
import 'package:cookie/screens/dindon/components/body_dindon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DindonScreen extends StatelessWidget {
  static String routeName = '/dindondetails';
  @override
  Widget build(BuildContext context) {
    final sweetId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Sweets>(context).findById(sweetId);
    final cart = Provider.of<Cart>(context);
    final AllSweetsDetailsArguments allarguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
      body: SingleChildScrollView(
          child: BodyDindonScreen(allSweets: allarguments.allSweets)),
    );
  }
}

class AllSweetsDetailsArguments {
  final Sweets allSweets;

  AllSweetsDetailsArguments({@required this.allSweets});
}
