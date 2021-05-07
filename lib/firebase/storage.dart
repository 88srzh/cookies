import 'dart:io';

import 'package:cookie/locator.dart';
import 'package:cookie/screens/auth/authentification_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: 'gs://food-83d92.appspot.com');

  AuthentificationService _authService = locator.get<AuthentificationService>();

  Future<String> uploadFile(File file) async {
    var user = await _authService.getUser();
    var storageRef = storage.ref().child('user/profile/${user.uid}');
    var uploadTask = storageRef.putFile(file);
    var completedTask = await uploadTask;
    String downloadUrl = await completedTask.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> getUserProfileImageDownloadUrl(String uid) {
    var storageRef = storage.ref().child('user/profile/$uid');
    return storageRef.getDownloadURL();
  }
}
