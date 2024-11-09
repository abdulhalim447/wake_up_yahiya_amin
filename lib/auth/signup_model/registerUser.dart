import 'dart:convert';
import 'package:http/http.dart' as http;

import 'UserModel.dart';

Future<UserModel?> registerUser(String mobile) async {
  final url = Uri.parse('https://yahiyaamin.xyz/api/register');
  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "mobile": mobile,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return UserModel.fromJson(data);
  } else {
    print("Failed to register: ${response.statusCode}");
    return null;
  }
}
