import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/task_management_body.dart';
import '../widgets/bottom_nav_bar.dart';

class TaskManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Wake Up'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: TaskManagementBody(),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
