class UserModel {
  String uid;
  String displayName;
  String avatarUrl;
  String email;
  String displaySurName;
  String phoneNumber;

  UserModel(this.uid,
      {this.displayName,
      this.displaySurName,
      this.avatarUrl,
      this.email,
      this.phoneNumber});
}
