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

  Future<void> signInWithEmailAndPassword(
      {String email, String password}) async {
    _currentUser = await _authService.signInWithEmailAndPassword(
        email: email, password: password);
    if (_currentUser.avatarUrl == null) {
      print('Надо добавить аватар');
    } else
    _currentUser.avatarUrl = await getDownloadURL();
  }

  void updateDisplayName(String displayName) {
    _currentUser.displayName = displayName;
    _authService.updateDisplayName(displayName);
    
  }

  // void updateDisplaySurName(String displaySurName) {
  //   _currentUser.displaySurName = displaySurName;
  //   _authService.updateDisplaySurName(displaySurName);
  // }

  void updatePhoneNumber(String phoneNumber) {
    _currentUser.phoneNumber = phoneNumber;
    _authService.updatePhoneNumber(phoneNumber);
  }

  Future<bool> validateCurrentPassword(String password) async {
    return await _authService.validatePassword(password);
  }

  void updateUserPassword(String password) {
    _authService.updatePassword(password);
  }

  void resetPassword(String email) {
    _authService.passwordReset(email);
  }

  void signOut() {
    _authService.signOut();
  }

  Future<void> signUpWithEmailAndPassword(
      {String email, String password}) async {
    _authService.signUpWithEmailAndPassword(email, password);
  }
}
