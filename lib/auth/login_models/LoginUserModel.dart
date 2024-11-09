class LoginUserModel {
  final int id;
  final String mobile;
  final String token;

  LoginUserModel({required this.id, required this.mobile, required this.token});

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      id: json['user']['id'],
      mobile: json['user']['mobile'],
      token: json['token'],
    );
  }
}
