import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Lab4 extends StatefulWidget {
  @override
  State<Lab4> createState() => _Lab4State();
}

class _Lab4State extends State<Lab4> {
  double number = 0.toDouble();
  String text = "Отжата";
  bool isPressed = false;
  int color = 80;
  int count = 0;
  int offcount = 0;
  var _list = ['a', 'b', 'c', 'd'];
  int count_p = 0;
  List<int> colorlist = [700, 400, 200, 100];
  double _value = 50.0;
  String hint = "выбери букву";
  List<bool> _isSelected = [false, true, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lab4'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'(^\-?\d*\.?\d*)')),
              ],
              onSubmitted: (num) {
                number = double.parse(num);
                print(number);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Введи число", helperText: "Число состоит из цифр"),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTapDown: (details) {
                            count++;
                            setState(() {
                              text = "зажата";
                            });
                          },
                          onTapUp: (details) {
                            offcount++;
                            setState(() {
                              text = "отжата";
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "кнопка",
                              textAlign: TextAlign.center,
                            ),
                            height: 50,
                            width: 70,
                            color: Colors.brown,
                          )),
                      Text(text),
                      Text("Число нажатий: $count"),
                      Text("Число отжатий: $offcount"),
                    ])),
            Positioned(
                top: 100,
                //height: 200,
                //width: 200,
                child: ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.bluetooth),
                    Icon(Icons.wifi),
                    Icon(Icons.flash_on),
                  ],
                  isSelected: _isSelected,
                  onPressed: (int index) {
                    setState(() {
                      _isSelected[index] = !_isSelected[index];
                    });
                  },
                )),
            Positioned(
                top: 350,
                height: 200,
                width: 200,
                child: DropdownButton<String>(
                  hint: Text(hint),
                  items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      hint = value.toString();
                    });
                  },
                )),
            Positioned(
                top: 560,
                width: 400,
                child: Stack(children: [
                  Slider(
                      min: 0.0,
                      max: 100.0,
                      value: _value,
                      onChanged: (value) => setState(() {
                            _value = value;
                          })),
                  Text("${_value.toStringAsFixed(0)}")
                ]))
          ],
        ),
      ),
    );
  }
}
