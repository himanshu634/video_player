import 'package:flutter/material.dart';

class Meme extends StatefulWidget {
  const Meme({Key? key}) : super(key: key);

  @override
  State<Meme> createState() => _MemeState();
}

class _MemeState extends State<Meme> {
  Offset _initialFocalPoint = Offset.zero;
  Offset _offset = Offset.zero;
  Offset _sessionOffset = Offset.zero;

  double _scale = 1.0;
  double _initialScale = 1.0;

  double _angle = 0;
  double _initialAngle = 0;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: _offset + _sessionOffset,
      child: Transform.rotate(
        angle: _angle,
        child: Transform.scale(
          scale: _scale,
          child: GestureDetector(
            onScaleStart: (details) {
              _initialScale = _scale;
              _initialFocalPoint = details.focalPoint;
              _initialAngle = _angle;
            },
            onScaleUpdate: (details) {
              setState(() {
                _angle = _initialAngle + details.rotation;
                _scale = _initialScale * details.scale;
                _sessionOffset = details.focalPoint - _initialFocalPoint;
              });
            },
            onScaleEnd: (details) {
              setState(() {
                _offset += _sessionOffset;
                _sessionOffset = Offset.zero;
              });
            },
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/Himanshu.png"),
            ),
          ),
        ),
      ),
    );
  }
}
