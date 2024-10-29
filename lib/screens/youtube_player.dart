import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  @override
  _YoutubeVideoPlayerState createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  YoutubePlayerController? _controller;
  TextEditingController _urlController = TextEditingController();
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer("https://youtu.be/IhLv7p0fh5Q?si=RXeC261IjL9j8lXo "); // Default video
  }

  void _initializePlayer(String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          forceHD: true,  // Force high definition video if available
        ),
      )..addListener(_playerListener);
    }
  }

  void _playerListener() {
    if (_controller != null && _controller!.value.isReady && !_isPlayerReady) {
      setState(() {
        _isPlayerReady = true;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _updateVideoUrl() {
    final newUrl = _urlController.text;
    final videoId = YoutubePlayer.convertUrlToId(newUrl);
    if (videoId != null && _controller != null) {
      _controller!.load(videoId);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid YouTube URL")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YouTube Player Example"),
      ),
      body: Column(
        children: [
          if (_controller != null)
            YoutubePlayer(
              controller: _controller!,
              showVideoProgressIndicator: true,
              onReady: () {
                _isPlayerReady = true;
              },
              onEnded: (metaData) {
                // Handle what happens after video ends (optional)
              },
            ),
          if (!_isPlayerReady)
            CircularProgressIndicator(), // Show a loading indicator until the player is ready
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _urlController,
              decoration: InputDecoration(
                hintText: "Enter YouTube video URL",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _updateVideoUrl,
            child: Text("Load Video"),
          ),
        ],
      ),
    );
  }
}
