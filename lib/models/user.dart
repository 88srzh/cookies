class UserModel {
  String uid;
  String displayName;
  String avatarUrl;
  String email;
  String phoneNumber;

  UserModel(this.uid, {this.displayName, this.avatarUrl, this.email, this.phoneNumber});
}
