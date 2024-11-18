import 'package:flutter/material.dart';
import 'package:wake_up/auth/login.dart';
import '../auth/login_models/loginUser.dart';

class AuthUtils {
  /// লগ-আউট প্রসেসিং লজিক
  static Future<void> logout(BuildContext context) async {
    await saveLoginState(""); // `null` এর পরিবর্তে খালি স্ট্রিং পাস করুন

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("You have successfully logged out."),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 2),
      ),
    );

    // লগইন স্ক্রিনে নেভিগেট করুন
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login()),
          (route) => false,
    );
  }

  /// কনফার্মেশন ডায়ালগ দেখানো
  static Future<bool?> showLogoutConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}
