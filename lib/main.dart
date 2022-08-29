import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './Widgets/video_player.dart';

void main() {
  debugPrintGestureArenaDiagnostics = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playing Video',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Video Player"),
        ),
        body: const VideoPlayerScreen(),
      ),
    );
  }
}
