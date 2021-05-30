import 'package:cookie/screens/terms_of_use/components/body_terms_of_use.dart';
import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  static String routeName = '/termsofuse';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Пользовательское соглашение',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BodyTermsOfUse(),
    );
  }
}
