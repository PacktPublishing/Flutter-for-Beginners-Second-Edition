import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapExample extends StatefulWidget {
  TapExample({Key? key}) : super(key: key);

  @override
  _TapExampleState createState() => _TapExampleState();
}

class _TapExampleState extends State<TapExample> {
  int _counter = 0;
  bool _dragging = false;
  Offset _move = Offset.zero;
  int _dragCount = 0;
  double _scale = 1.0;
  bool _resizing = false;
  int _scaleCount = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _counter++;
        });
      },
      onDoubleTap: () {
        setState(() {
          _counter++;
        });
      },
      onLongPress: () {
        setState(() {
          _counter++;
        });
      },
      onHorizontalDragStart: (DragStartDetails details) {
        setState(() {
          _move = Offset.zero;
          _dragging = true;
        });
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          _move += details.delta;
        });
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        setState(() {
          _dragging = false;
          _dragCount++;
        });
      },
      onScaleStart: (ScaleStartDetails details) {
        setState(() {
          _scale = 1.0;
          _resizing = true;
        });
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        setState(() {
          _scale = details.scale;
        });
      },
      onScaleEnd: (ScaleEndDetails details) {
        setState(() {
          _resizing = false;
          _scaleCount++;
        });
      },
      child: Container(
        color: Colors.grey,
        child: Text(
          "Tap count: $_counter",
        ),
      ),
    );
  }
}
