import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab1/labs/lab7/trafficLight.dart';

class Traffic1 extends StatefulWidget {
  const Traffic1({Key? key}) : super(key: key);

  @override
  State<Traffic1> createState() => _Traffic1State();
}

class _Circle extends StatelessWidget {
  final _size = 100.0;
  late final _color;

  _Circle(this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: _color ?? Colors.black,
      ),
    );
  }
}

class _Traffic1State extends State<Traffic1> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation _offsetAnimation;
  late Animation _offsetAnimation1;
  late Animation _offsetAnimation2;
  List<Icon> _images = [
    Icon(Icons.directions_bike),
    Icon(Icons.accessible_forward)
  ];
  Random random = new Random(45353453453);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: random.nextInt(20)));
    _controller.addListener(() {
      setState(() {});
    });
    _controller1 = AnimationController(
        vsync: this, duration: Duration(seconds: random.nextInt(20)));
    _controller1.addListener(() {
      setState(() {});
    });
    _controller2 = AnimationController(
        vsync: this, duration: Duration(seconds: random.nextInt(20)));
    _controller2.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller1.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _offsetAnimation = Tween<Offset>(
            begin: const Offset(0, 0),
            end: Offset(MediaQuery.of(context).size.width - 50, 0))
        .animate(_controller);
    _offsetAnimation.addListener(() {
      setState(() {});
    });
    _offsetAnimation1 = Tween<Offset>(
            begin: const Offset(0, 0),
            end: Offset(MediaQuery.of(context).size.width - 50, 0))
        .animate(_controller1);
    _offsetAnimation1.addListener(() {
      setState(() {});
    });
    _offsetAnimation2 = Tween<Offset>(
            begin: const Offset(0, 0),
            end: Offset(MediaQuery.of(context).size.width - 50, 0))
        .animate(_controller2);
    _offsetAnimation2.addListener(() {
      setState(() {});
    });
    return Scaffold(
        appBar: AppBar(
          title: const Text('Traffic Light'),
        ),
        body: Stack(
          children: [
            TrafficLight(
              onGreenStart: () {
                _controller.forward();
                _controller1.forward();
                _controller2.forward();
              },
              onGreedEnd: () {
                _controller.reset();
                _controller1.reset();
                _controller2.reset();
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                children: [
                  Transform.translate(
                    offset: _offsetAnimation.value,
                    child: _images[0],
                  ),
                  Transform.translate(
                    offset: _offsetAnimation1.value,
                    child: _images[1],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
