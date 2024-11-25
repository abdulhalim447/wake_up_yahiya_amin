import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wake_up/auth/sign_up.dart';
import 'package:wake_up/screens/task_management_screen.dart';
import '../utils/utility.dart';
import 'login_models/loginUser.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _mobileController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    final mobile = _mobileController.text;
    if (mobile.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      final user = await loginUser(mobile);

      setState(() {
        _isLoading = false;
      });

      if (user != null) {
        _mobileController.clear();
        await saveLoginState(user.token);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login successful!"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => TaskManagementScreen()),
              (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login failed. Please try again."),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorDarkBlue,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Lottie.asset(
                    'assets/animation/animation_one.json',
                    width: 450,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    "Learn with ",
                    style: Head1Text(colorWhite),
                  ),
                  SizedBox(height: 1),
                  Text(
                    "Yahiya Amin",
                    style: Head6Text(colorLight),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _mobileController,
                    decoration: AppInputDecoration("Enter Mobile Number"),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: _isLoading
                          ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.0,
                        ),
                      )
                          : SuccessButtonChild("Login"),
                      onPressed: _isLoading ? null : _login,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: Head6Text(colorWhite).copyWith(fontSize: 14),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          ' Register now',
                          style: Head6Text(colorBlue)
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _mobileController.dispose();
    super.dispose();
  }
}
