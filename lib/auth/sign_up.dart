import 'package:flutter/material.dart';
import 'package:wake_up/auth/login.dart';

import '../utils/utility.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get started with ",
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
                  decoration: AppInputDecoration("Name"),
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
                TextFormField(
                  decoration: AppInputDecoration("Password"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: AppInputDecoration("Occupation (optional)"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild("Register"),
                    onPressed: () {},
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Already have an account?',
                      style: Head6Text(colorWhite).copyWith(
                          fontSize: 14
                      ),
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
                        style: Head6Text(colorBlue)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
