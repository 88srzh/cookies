import 'package:cookie/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthentificationService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // AuthentificationService();
  // Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  Stream<User> get authStateChanges => _auth.authStateChanges();

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // final AuthCredential credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await _auth.signInWithCredential(credential);
  }

  Future<UserModel> signInWithEmailAndPassword(
      {String email, String password}) async {
    var authResults = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return UserModel(authResults.user.uid,
        displayName: authResults.user.displayName);
  }

  Future<UserModel> getUser() async {
    var firebaseUser = _auth.currentUser;
    return UserModel(firebaseUser.uid,
        displayName: firebaseUser.displayName, email: firebaseUser.email);
  }

  Future<void> updateDisplayName(String displayName) async {
    var user = _auth.currentUser;
    user.updateProfile(displayName: displayName);
  }

  // Future<void> updateDisplaySurName(String displaySurName) async {
  //   var user = _auth.currentUser;
  //   user.updateProfile(displaySurName: displaySurName);
  // }

  // ! fix
  void updatePhoneNumber(String phoneNumber) async {
    var user = _auth.currentUser;
    // user.updatePhoneNumber();
  }

  Future<bool> validatePassword(String password) async {
    var firebaseUser = _auth.currentUser;
    var authCredential = EmailAuthProvider.credential(
        email: firebaseUser.email, password: password);
    try {
      var authResult =
          await firebaseUser.reauthenticateWithCredential(authCredential);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void updatePassword(String password) async {
    var firebaseUser = _auth.currentUser;
    firebaseUser.updatePassword(password);
  }

  Future<String> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return ('Зарегистрировались');
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

  void passwordReset(email) async {
    _auth.sendPasswordResetEmail(email: email);
  }
}
