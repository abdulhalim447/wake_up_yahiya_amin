import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wake_up/auth/sign_up.dart';
import 'package:wake_up/screens/task_management_screen.dart';

import '../utils/utility.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Yahiya Amin",
                    style: Head6Text(colorLight),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: AppInputDecoration("Mobile"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // TextFormField(
                  //   decoration: AppInputDecoration("Password"),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild("Login"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TaskManagementScreen(),),);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: Head6Text(colorWhite).copyWith(
                          fontSize: 14
                        ),
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
}
