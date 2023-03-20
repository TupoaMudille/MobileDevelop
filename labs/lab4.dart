import 'package:flutter/material.dart';

class Lab4 extends StatefulWidget {
  @override
  State<Lab4> createState() => _Lab4State();
}

class _Lab4State extends State<Lab4> {
  int number = 0;
  String text = "Отжата";
  bool isPressed = false;
  int color = 80;
  int count = 0;
  int offcount = 0;
  List<String> list = ['a', 'b', 'c', 'd'];
  List<int> colorlist = [700, 400, 200, 100];
  double _value = 50.0;

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
              onSubmitted: (num) {
                number = int.parse(num);
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
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(color, 247, 232, 99)),
                        onPressed: () {
                          setState(() {
                            if (isPressed) {
                              text = "Нажата";
                              isPressed = false;
                              color = 200;
                              count++;
                            } else {
                              text = "Отжата";
                              isPressed = true;
                              color = 80;
                              offcount++;
                            }
                          });
                        },
                        child: Text('Кнопка',
                            style: TextStyle(color: Colors.black)),
                      ),
                      Text(text),
                      Text("Число нажатий: $count"),
                      Text("Число отжатий: $offcount"),
                    ])),
            Positioned(
                top: 350,
                height: 200,
                width: 200,
                child: ListView(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.amber[colorlist[0]]),
                      child: Text('${list[0]}'),
                      onPressed: () {
                        print({list[0]});
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.amber[colorlist[1]]),
                      child: Text('${list[1]}'),
                      onPressed: () {
                        print({list[1]});
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.amber[colorlist[2]]),
                      child: Text('${list[2]}'),
                      onPressed: () {
                        print({list[2]});
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.amber[colorlist[3]]),
                      child: Text('${list[3]}'),
                      onPressed: () {
                        print({list[3]});
                      },
                    ),
                  ],
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
