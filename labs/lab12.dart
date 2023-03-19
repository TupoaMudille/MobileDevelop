import 'package:flutter/material.dart';

class Lab12 extends StatefulWidget {
  @override
  State<Lab12> createState() => _Lab12State();
}

class _Lab12State extends State<Lab12> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Lab1-2 Clicker'),
            centerTitle: true,
          ),
          body: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _count--;
                  });
                },
                child: Icon(Icons.remove),
                backgroundColor: Colors.amber,
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.amber,
              ),
              Text('Count: $_count'),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _count = 0;
                  });
                },
                child: Text('Сброс'),
                backgroundColor: Colors.amber,
              ),
            ],
          ))),
    );
  }
}
