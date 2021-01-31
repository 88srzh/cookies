import 'package:cookie/screens/dindon/dindon_main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthentificationService {
  // static String routeName = '/authService';
  final FirebaseAuth _firebaseAuth;

  AuthentificationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Вошли';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Зарегистрировались';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
