class UserModel {
  String? username;
  String? imageUrl;
  String uid;
  String email;

  UserModel({
    this.username,
    this.imageUrl,
    required this.email,
    required this.uid,
  }) {}
}

UserModel localUser = new UserModel(
  username: "Test",
  email: "test@test.com",
  uid: "ba5q48q6s2d13e54r3ea85",
  imageUrl:
      "https://cdn.shopify.com/s/files/1/0509/4994/7585/files/standing_2f411aaf-20de-42ce-9a7f-86e1dd34a51a_1200x1200.png?v=1623685000",
);
