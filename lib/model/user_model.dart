class UserModel {
  String? userName, name, email, ans1, ans2, ans3;

  UserModel({
    required this.userName,
    required this.name,
    required this.email,
    required this.ans1,
    required this.ans2,
    required this.ans3,
  });

  factory UserModel.fromJson(Map json) {
    return UserModel(
      userName: json['userName'],
      name: json['name'],
      email: json['email'],
      ans1: json['ans1'],
      ans2: json['ans2'],
      ans3: json['ans3'],
    );
  }

  static Map<String, Object?> toMap(UserModel user) {
    return {
      'userName': user.userName,
      'name': user.name,
      'email': user.email,
      'ans1': user.ans1,
      'ans2': user.ans2,
      'ans3': user.ans3,
    };
  }
}
