import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginUserModel.dart';


Future<LoginUserModel?> loginUser(String mobile) async {
  final url = Uri.parse('https://yahiyaamin.xyz/api/login');
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"mobile": mobile}),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return LoginUserModel.fromJson(data);
  } else {
    print("Login failed: ${response.statusCode}");
    return null;
  }
}


Future<void> saveLoginState(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<bool> checkLoginState() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token') != null;
}
