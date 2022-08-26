import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = true;
  bool _isMute = false;
  Duration? _duration;
  bool _isPlayable = true;

  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.network(
    //   "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    // )..initialize().then((_) => setState(() {}));
    _controller = VideoPlayerController.asset(
      "videos/vid.mp4",
    )..initialize().then((_) => setState(() {}));
    _duration = _controller.value.duration;
    if (_duration!.inSeconds > 30) {
      setState(() {
        _isPlayable = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return !_isPlayable
        ? const Center(
            child: Text("Video can't be played."),
          )
        : Container(
            width: double.infinity,
            height: _controller.value.size.height,
            decoration: BoxDecoration(
              border: Border.all(width: 2),
            ),
            padding: const EdgeInsets.all(2),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  !_isMute
                      ? _controller.setVolume(0)
                      : _controller.setVolume(1);
                  _isMute = !_isMute;
                });
              },
              onLongPress: () => setState(() {
                !_isPlaying ? _controller.play() : _controller.pause();
                _isPlaying = !_isPlaying;
              }),
              child: Stack(
                children: [
                  _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : const CircularProgressIndicator(),

                  // Center(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       OutlinedButton(
                  //         onPressed: () {
                  //           setState(() {
                  //             !_isMute
                  //                 ? _controller.setVolume(0)
                  //                 : _controller.setVolume(1);
                  //             _isMute = !_isMute;
                  //           });
                  //         },
                  //         child: Icon(_isMute ? Icons.music_off : Icons.music_note),
                  //       ),
                  //       OutlinedButton(
                  //         onPressed: () {
                  //           setState(() {
                  //             !_isPlaying ? _controller.play() : _controller.pause();
                  //             _isPlaying = !_isPlaying;
                  //           });
                  //         },
                  //         child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          );
  }
}
