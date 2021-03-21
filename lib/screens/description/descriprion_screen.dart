import 'dart:ui';

import 'package:cookie/screens/description/components/appbar_description.dart';
import 'package:cookie/screens/description/components/bottom_add_to_cart.dart';
import 'package:cookie/screens/home/components/body_description.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  // final Cart cart;
  static const routeName = '/description';
  // const DescriptionScreen({this.cart});
  @override
  Widget build(BuildContext context) {
    window.physicalSize;
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
        appBar: AppBarDescription(),
        body: BodyDescription(),
        bottomNavigationBar: BottomDescription());
  }
}
