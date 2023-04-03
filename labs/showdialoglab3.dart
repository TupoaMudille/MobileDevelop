import 'dart:async';

import 'package:flutter/material.dart';

class showDialog3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DatePicker',
      home: Page(title: 'DatePicker'),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Page> createState() => _State();
}

class _State extends State<Page> {
  String text = "";
  int a = 0;
  int b = 0;
  int sum = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("showdialog"),
      ),
      body: Container(
        child: Center(
          child: AlertDialog(
            title: Text("сумматор"),
            actions: [
              TextField(
                onChanged: (text) {
                  a = int.parse(text);
                },
                decoration: InputDecoration(hintText: 'число А'),
              ),
              TextField(
                onChanged: (text) {
                  b = int.parse(text);
                },
                decoration: InputDecoration(hintText: 'число А'),
              ),
              Text("Сумма: $sum"),
              Row(children: [
                FloatingActionButton(
                    child: Text(
                      'Сложить',
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () {
                      setState(() {
                        sum = a + b;
                        print(sum);
                      });
                    }),
                FloatingActionButton(
                    child: Text('Cброс'),
                    onPressed: () {
                      setState(() {
                        sum = 0;
                      });
                    }),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
