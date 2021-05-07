import 'dart:io';

import 'package:cookie/firebase/storage.dart';
import 'package:cookie/locator.dart';
import 'package:cookie/models/user.dart';
import 'package:cookie/screens/auth/authentification_service.dart';

class UserController {
  UserModel _currentUser;
  AuthentificationService _authService = locator.get<AuthentificationService>();
  Storage _storage = locator.get<Storage>();
  Future init;

  UserController() {
    init = initUser();
  }

  Future<UserModel> initUser() async {
    _currentUser = await _authService.getUser();
    return _currentUser;
  }

  UserModel get currentUser => _currentUser;

  Future<void> uploadProfilePicture(File image) async {
    _currentUser.avatarUrl = await _storage.uploadFile(image);
  }

  Future<String> getDownloadURL() async {
    return await _storage.getUserProfileImageDownloadUrl(currentUser.uid);
  }

  Future<void> signInWithEmailAndPassword({String email, String password}) async {
    _currentUser = await _authService.signInWithEmailAndPassword(email: email, password: password);
    _currentUser.avatarUrl = await getDownloadURL();
  }

  void updateDisplayName(String displayName) {
    _currentUser.displayName = displayName;
    _authService.updateDisplayName(displayName);
  }

  Future<bool> validateCurrentPassword(String password) async {
    return await _authService.validatePassword(password);
  }

  void updateUserPassword(String password) {
    _authService.updatePassword(password);
  }

  void signOut() {
    _authService.signOut();
  }
}
