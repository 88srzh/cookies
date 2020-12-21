import 'package:cookie/screens/icecream/components/body_icecream.dart';
import 'package:flutter/material.dart';

class IceCreamScreen extends StatelessWidget {
  const IceCreamScreen({Key keyIceCream}) : super(key: keyIceCream);
  static String routeName = '/icecream';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мороженое'),
      ),
      body: BodyIceCream(),
    );
  }
}
