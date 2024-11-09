class UserModel {
  final String mobile;
  final int id;

  UserModel({required this.mobile, required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      mobile: json['user']['mobile'],
      id: json['user']['id'],
    );
  }
}
