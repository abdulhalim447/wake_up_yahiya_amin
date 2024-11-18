import 'package:flutter/material.dart';
import 'package:wake_up/auth/login.dart';
import 'package:wake_up/screens/task_management_screen.dart';
import '../auth/login_models/loginUser.dart';
import '../utils/utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _checkLoginAndNavigate() async {
    // লগইন স্টেট চেক করুন
    final bool isLoggedIn = await checkLoginState();

    await Future.delayed(const Duration(seconds: 2)); // স্প্ল্যাশ স্ক্রিনের জন্য ডিলে

    // নেভিগেট করুন
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TaskManagementScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLoginAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset('assets/images/wake_up_logo.png', height: 200, width: 200),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(
                "Version 1.0.0",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
