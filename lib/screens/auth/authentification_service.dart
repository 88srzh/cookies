import 'package:cookie/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthentificationService {
  // AuthentificationService(this._firebaseAuth);
  AuthentificationService();

  // final FirebaseAuth _firebaseAuth;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  Stream<User> get authStateChanges => _auth.authStateChanges();

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    final User user = (await _auth.signInWithCredential(credential)).user;
    print('Вошли ' + user.displayName);
  }

  Future<void> signInWithEmailAndPassword({String email, String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserModel> getUser() async {
    var firebaseUser = _auth.currentUser;
    return UserModel(firebaseUser.uid, displayName: firebaseUser.displayName);
  }

  // Future<String> signIn({String email, String password}) async {
  //   try {
  //     final currentUser = _auth.currentUser;
  //     final credential = EmailAuthProvider.credential(email: email, password: password);
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     return 'Вошли';
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }
  // ! - Refactor signUp
  Future<String> signUp({String email, String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return 'Зарегистрировались';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
