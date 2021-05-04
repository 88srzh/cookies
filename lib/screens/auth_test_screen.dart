import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TestAuthScreen extends StatelessWidget {
  static String routeName = '/testAuth';

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 35.0),
            child: Column(
              children: [
                Container(
        child: Text(currentUser.toString(), style: TextStyle(fontSize: 20)),
      ),
      Container(
        child: Text(currentUser.email),
      ),
      Container(
        child: Text(currentUser.uid),
      ),
              ],
            ),
          ),
    );
  }
}
