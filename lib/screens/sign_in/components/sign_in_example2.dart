import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  final Function(User) onSignInAnonymous;
  SignInPage({@required this.onSignInAnonymous});

  loginAnonymous() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    onSignInAnonymous(userCredential.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: FlatButton(
        onPressed: () {
          loginAnonymous();
        },
        child: Text('Press'),
      ),
    );
  }
}
