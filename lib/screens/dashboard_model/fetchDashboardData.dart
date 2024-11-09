import 'dart:convert';
import 'package:http/http.dart' as http;
import 'DashboardData.dart';
import 'package:shared_preferences/shared_preferences.dart';

// getToken ফাংশন তৈরি করা
Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

// fetchDashboardData ফাংশন যেখানে getToken ব্যবহার করা হচ্ছে
Future<DashboardData?> fetchDashboardData() async {
  final url = Uri.parse('https://yahiyaamin.xyz/api/dashboard');
  final token = await getToken(); // টোকেন রিকোভার করা

  if (token == null) {
    print("Token is not available.");
    return null;
  }

  try {
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return DashboardData.fromJson(data);
    } else {
      print("Failed to load data: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("Error: $e");
    return null;
  }
}
