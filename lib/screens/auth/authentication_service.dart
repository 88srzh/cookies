// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// abstract class IAuthService {
//   // Future<UserModel> getCurrentUser();
//   Future<void> signOut();
//   Stream<User> onAuthStateChanged();
//   Future<UserCredential> signInWithEmailAndPassword({
//     @required String email,
//     @required String password,
//   });

//   Future<UserCredential> createUserWithEmailAndPassword(
//       {@required String email, @required String password});
//   // void updatePassword({@required String password});
//   // Future<void> deleteUser({@required String userID});
//   // Future<void> resetPassword({@required String email});
// }

// class AuthService extends IAuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   // final CollectionReference _userDB =
//   //     FirebaseFirestore.instance.collection('Users');

//   // @override
//   // Future<UserModel> getCurrentUser() async {
//   //   try {
//   //     final User firebaseUser = _auth.currentUser;
//   //     final DocumentSnapshot documentSnapshot = await _userDB.doc(firebaseUser.uid).get();
//   //     return UserModel.fromDoc(ds: documentSnapshot);
//   //   } catch (e) {
//   //     throw Exception('Could not fetch user at this time');
//   //   }
//   // }

//   @override
//   Stream<User> onAuthStateChanged() {
//     return _auth.authStateChanges();
//   }

//   @override
//   Future<void> signOut() {
//     return _auth.signOut();
//   }

//   @override
//   Future<UserCredential> createUserWithEmailAndPassword(
//       {@required String email, @required String password}) {
//     return _auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//   }

//   @override
//   Future<UserCredential> signInWithEmailAndPassword(
//       {@required String email, @required String password}) {
//     return _auth.signInWithEmailAndPassword(email: email, password: password);
//   }
// }
