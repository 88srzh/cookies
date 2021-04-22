import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookie/screens/description/components/appbar_description.dart';
import 'package:cookie/screens/description/components/bottom_add_to_cart.dart';
import 'package:cookie/screens/description/components/body_description.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  static const routeName = '/description';
  final String id;

  DescriptionScreen({this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 219, 221, 1.0),
      appBar: AppBarDescription(),
      body: BodyDescription(),
      // bottomNavigationBar: BottomDescription());
    );
  }
}
