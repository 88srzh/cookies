import 'package:cookie/license/components/body_license.dart';
import 'package:flutter/material.dart';

class LicenseScreen extends StatelessWidget {
  static String routeName = '/license';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Лицензия',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BodyLicense(),
    );
  }
}
