import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wake_up/auth/login.dart';
import '../utils/utility.dart';
import 'signup_model/registerUser.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _mobileController = TextEditingController();
  bool _isLoading = false;

  void _register() async {
    final mobile = _mobileController.text;
    if (mobile.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      final user = await registerUser(mobile);

      setState(() {
        _isLoading = false;
      });

      if (user != null) {
        _mobileController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registration successful!"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.push(context, MaterialPageRoute(builder: (builder) => Login()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Registration Failed"),
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
                    fit: BoxFit.fill,
                  ),
                  Text(
                    "Get started with ",
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
                    decoration: AppInputDecoration("Mobile"),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,  // বাটন পুরো প্রস্থে নিতে হলে
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: _isLoading
                          ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.green,
                          strokeWidth: 2.0,
                        ),
                      )
                          : SuccessButtonChild("Register"),
                      onPressed: _isLoading ? null : _register,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Already have an account?',
                        style: Head6Text(colorWhite).copyWith(fontSize: 14),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          ' Login now',
                          style: Head6Text(colorBlue).copyWith(fontWeight: FontWeight.bold),
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
