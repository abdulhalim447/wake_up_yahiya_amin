import 'package:flutter/material.dart';
import 'package:wake_up/screens/all_abouts/about_app.dart';
import 'package:wake_up/screens/all_abouts/about_yahia_amin.dart';

import '../screens/dashboard_model/DashboardData.dart';
import '../utils/auth_utils.dart';
import '../utils/utility.dart';

class AppDrawer extends StatelessWidget {
  late DashboardData dashboardData;

  static void showSnackbar(BuildContext context, String message,
      {Color? backgroundColor, Duration? duration}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor ?? Colors.black,
      duration: duration ?? const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _handleLogout(BuildContext context) async {
    final bool? confirmLogout =
        await AuthUtils.showLogoutConfirmationDialog(context);

    // যদি নিশ্চিত করা হয়, তাহলে লগ-আউট লজিক কার্যকর করুন
    if (confirmLogout ?? false) {
      await AuthUtils.logout(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Header of the Drawer
            Material(
              color: colorDarkBlue,
              child: InkWell(

                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top, bottom: 24),
                  child: const Column(
                    children: [
                      CircleAvatar(
                        radius: 52,
                        backgroundImage: AssetImage(
                            'assets/images/wake_up_logo.png'),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Wake Up',
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                      Text(
                        'Task Management',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Header Menu items
            Column(
              children: [

                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About App'),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (builder) => AboutApp()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('About Yahiya Amin'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => AboutYahiyaAmin()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Log out'),
                  onTap: () {
                    _handleLogout(context);
                  },
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
