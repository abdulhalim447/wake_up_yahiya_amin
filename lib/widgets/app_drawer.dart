import 'package:flutter/material.dart';
import 'package:wake_up/screens/all_abouts/about_app.dart';
import 'package:wake_up/screens/all_abouts/about_yahia_amin.dart';

import '../screens/dashboard_model/DashboardData.dart';
import '../utils/auth_utils.dart';

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
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue[100],
            ),
          ),
          /* ListTile(
            title: Text('Total task'),
            onTap: () {
              print(dashboardData.totalTasks.toString());
              showSnackbar(
                context,
                'Total Tasks: ${dashboardData.totalTasks.toString()}',
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 3),
              );
            },
          ),*/
          /*ListTile(
            title: Text('Complete task'),
            onTap: () {
              showSnackbar(
                context,
                'Tasks Done: ${dashboardData.taskDone.toString()}',
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 3),
              );
            },
          ),*/

          /*ListTile(
            title: Text('Task History'),
            onTap: () {},
          ),*/

          ListTile(
            title: Text('About App'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => AboutApp()));
            },
          ),
          ListTile(
            title: Text('About Yahiya Amin'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => AboutYahiyaAmin()));
            },
          ),
          ListTile(
            title: Text('Log out'),
            onTap: () {
              _handleLogout(context);
            },
          ),
        ],
      ),
    );
  }
}
