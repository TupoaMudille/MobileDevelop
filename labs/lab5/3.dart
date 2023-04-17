import 'package:flutter/material.dart';

class MainScreen3 extends StatefulWidget {
  @override
  State<MainScreen3> createState() => _MainScreen3State();
}

String text = "";
String temp = "";

@override
class _MainScreen3State extends State<MainScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Текстовое окно')),
      body: Container(
          child: Column(
        children: [
          Container(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actions: [
                          TextField(
                            onChanged: (temp) {
                              setState(() {
                                text = temp;
                              });
                            },
                          )
                        ],
                      );
                    });
              })),
          Container(alignment: Alignment.bottomCenter, child: Text("$text")),
        ],
      )),
    );
  }
}
