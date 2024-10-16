import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Total task'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Complete task'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Video list'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Task History'),
            onTap: () {},
          ),
          ListTile(
            title: Text('About App'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
