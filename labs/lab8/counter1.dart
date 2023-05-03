import 'package:flutter/material.dart';

class App1 extends StatefulWidget {
  const App1({Key? key}) : super(key: key);

  @override
  State<App1> createState() => _App1State();
}

class Counter {
  int _count = 0;

  Counter(this._count);

  int get count => _count;

  void increment() => _count++;

  void decrement() => _count--;

  void reset() => _count = 0;
}

class _App1State extends State<App1> {
  final Counter _counter = Counter(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${_counter.count}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                        onPressed: () => setState(() {
                              _counter.increment();
                            }),
                        child: Icon(Icons.plus_one)),
                    FloatingActionButton(
                        onPressed: () => setState(() {
                              _counter.decrement();
                            }),
                        child: Icon(Icons.exposure_minus_1)),
                    FloatingActionButton(
                        onPressed: () => setState(() {
                              _counter.reset();
                            }),
                        child: Icon(Icons.restore_sharp)),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
