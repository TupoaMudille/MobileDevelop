import 'package:flutter/material.dart';

class TrafficLight extends StatefulWidget {
  const TrafficLight(
      {Key? key, required this.onGreenStart, required this.onGreedEnd})
      : super(key: key);

  final void Function() onGreenStart;
  final void Function() onGreedEnd;

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _Circle extends StatelessWidget {
  final _size = 100.0;
  final _color;

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

class _TrafficLightState extends State<TrafficLight>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _doubleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _doubleAnimation =
        Tween<double>(begin: 0.0, end: 100.0).animate(_controller);
    _doubleAnimation.addListener(() {
      setState(() {
        if (_doubleAnimation.value > 53.0) {
          widget.onGreenStart();
        } else {
          widget.onGreedEnd();
        }
      });
    });
    _controller.addListener(() {
      setState(() {});
    });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Circle(_doubleAnimation.value < 47.0 ? Colors.red : null),
          _Circle(_doubleAnimation.value < 53.0 && _doubleAnimation.value > 47.0
              ? Colors.yellow
              : null),
          _Circle(_doubleAnimation.value > 53.0 ? Colors.green : null),
        ],
      ),
    );
  }
}
