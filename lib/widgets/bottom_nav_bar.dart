import 'package:flutter/material.dart';
import 'package:wake_up/screens/youtube_player.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.blue,
     /* onTap: (index) {
        if(index == 1){
          Navigator.push(context, MaterialPageRoute(builder: (context) => YoutubeVideoPlayer(videoUrl: ,),));
        }
      },*/
    );
  }
}
