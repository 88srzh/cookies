import 'package:firebase_auth/firebase_auth.dart';

class AuthentificationService {
  static String routeName = '/authService';
  final Function(User) onSignOut;

  AuthentificationService({this.onSignOut});

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    onSignOut(null);
  }
}
