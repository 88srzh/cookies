import 'package:cookie/screens/auth/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleLogoutPage extends StatelessWidget {
  static String routeName = '/googleLogout';
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Вошли',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(user.photoURL),
          ),
          SizedBox(height: 8),
          Text(
            'Имя: ' + user.displayName,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Почта: ' + user.email,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final googleProvider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              googleProvider.logout();
            },
            child: Text('Выйти'),
          ),
        ],
      ),
    );
  }
}
