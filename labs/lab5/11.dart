import 'package:flutter/material.dart';

int count = 0;

class MainScreen11 extends StatefulWidget {
  @override
  State<MainScreen11> createState() => _MainScreen11State();
}

@override
class _MainScreen11State extends State<MainScreen11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Обложка кликер')),
        body: Container(
          child: AlertDialog(actions: [
            Container(
              child: Center(
                child: Text("$count"),
              ),
            ),
            Container(
                alignment: Alignment(-1, 1),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                          child: Icon(Icons.plus_one),
                          onPressed: () {
                            setState(() {
                              count++;
                            });
                          }),
                      FloatingActionButton(
                          child: Icon(Icons.exposure_minus_1),
                          onPressed: () {
                            setState(() {
                              count--;
                            });
                          }),
                      FloatingActionButton(
                          child: Icon(Icons.replay),
                          onPressed: () {
                            setState(() {
                              count = 0;
                            });
                          }),
                    ])),
          ]),
        ));
  }
}
