import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './meme.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.network(
    //   "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    // )..initialize().then((_) => setState(() {}));
    _controller = VideoPlayerController.asset(
      "videos/vid.mp4",
    )..initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoPlayer(_controller),
        Meme(),
        Meme(),
        Meme(),
      ],
    );
  }
}
