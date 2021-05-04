import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class AuthentificationService {
  AuthentificationService(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      final credential = EmailAuthProvider.credential(email: email, password: password);
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return 'Вошли';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return 'Зарегистрировались';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signInAnonymously() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      User user = userCredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
