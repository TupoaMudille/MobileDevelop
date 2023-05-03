import 'package:flutter/material.dart';
import 'dart:math' as math;

class Text2 extends StatefulWidget {
  final double _height;

  const Text2({Key? key, required double height}) : _height = height;

  @override
  State<Text2> createState() => _Text2State(_height);
}

class _Text2State extends State<Text2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _offsetAnimation;
  late Animation _rotateAnimation;
  late Animation _colorAnimation;
  final double _height;

  _Text2State(this._height);

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _offsetAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: Offset(0, _height - 150))
            .animate(_controller);
    _offsetAnimation.addListener(() {
      setState(() {});
    });
    _rotateAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _colorAnimation = ColorTween(
            begin: Color.fromARGB(255, 68, 33, 243),
            end: Color.fromARGB(255, 255, 73, 7))
        .animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hello World!'),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Transform.translate(
            offset: _offsetAnimation.value,
            child: Transform.rotate(
              angle: math.pi * _rotateAnimation.value,
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    _controller.forward();
                  });
                },
                onTapUp: (details) {
                  setState(() {
                    _controller.reverse();
                  });
                },
                child: Text(
                  'Hello World!',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: _colorAnimation.value,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
