import 'package:flutter/material.dart';

import '../screens/youtube_player.dart';

class VideoSection extends StatelessWidget {
  final String videoUrl;

  VideoSection({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your daily video",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: videoUrl.isNotEmpty
                ? IconButton(
              icon: Icon(Icons.play_circle_outline, size: 50, color: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YoutubeVideoPlayer(/*videoUrl: videoUrl*/),
                  ),
                );
              },
            )
                : Text("No video available"),
          ),
        ),
      ],
    );
  }
}
