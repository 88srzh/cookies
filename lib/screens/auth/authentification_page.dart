import 'package:cookie/screens/auth/authentification_wrapper.dart';
import 'package:flutter/material.dart';

class AuthentificationPage extends StatelessWidget {
  static String routename = '/authPage';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AuthentificationWrapper(),
    );
  }
}
