import 'dart:async';

import 'package:flutter/material.dart';

class Lab3 extends StatefulWidget {
  @override
  State<Lab3> createState() => _Lab3State();
}

class _Lab3State extends State<Lab3> {
  int a = 0, b = 0, sum = 0;
  int steps = 0;

  bool isTime = false;

  void update() {
    Timer.periodic(
        const Duration(seconds: 1),
        (timer) => setState(
              () {
                if (isTime) {
                  steps.abs() < 20
                      ? steps = steps + 1
                      : {isTime = false, steps = 0};
                }
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.indigo),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Lab3'),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              //3 квадрата+надпись
              Positioned(
                width: 150,
                height: 75,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(-1.0, -1.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.0, 1.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.5, -1.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                        child: Center(
                            child: Text(
                          'Квадрат',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                      ),
                    )
                  ],
                ),
              ),

              //5 квадратов через колонки и строки
              Positioned(
                  top: 90,
                  width: 160,
                  height: 110,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment(-1.0, -1.0),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      color: Colors.red,
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      color: Colors.pink,
                                    )
                                  ],
                                ),
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.topCenter,
                                        width: 50,
                                        height: 50,
                                        color: Colors.green,
                                      )
                                    ]),
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.blue,
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.black,
                                      )
                                    ])
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),

              //через грид
              Positioned(
                  width: 160,
                  height: 110,
                  top: 210,
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: [
                      Container(
                        color: Colors.red,
                      ),
                      Container(
                        color: Colors.green,
                      ),
                      Container(
                        color: Colors.blue,
                      ),
                      Container(
                        color: Colors.pink,
                      ),
                      Container(),
                      Container(
                        color: Colors.black,
                      )
                    ],
                  )),

              //поворот
              Positioned(
                  top: 330,
                  left: 60,
                  height: 50,
                  width: 50,
                  child: Container(
                    transform: new Matrix4.rotationZ(0.7854),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      color: Colors.black,
                    ),
                  )),

              //сумматор
              Positioned(
                  top: 390,
                  width: 200,
                  child: Column(
                    children: [
                      TextField(
                        onSubmitted: (text) {
                          a = int.parse(text);
                        },
                        decoration: InputDecoration(hintText: 'число А'),
                      ),
                      TextField(
                        onSubmitted: (text) {
                          b = int.parse(text);
                        },
                        decoration: InputDecoration(hintText: 'число В'),
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
                              });
                            }),
                        FloatingActionButton(
                            child: Text('Cброс'),
                            onPressed: () {
                              setState(() {
                                sum = 0;
                              });
                            }),
                      ]),
                    ],
                  )),

              //анимация
              Positioned(
                right: 50,
                child: Transform.translate(
                  offset: Offset(0, steps.toDouble() * 5),
                  child: Container(
                    width: 50.0 + steps * 5,
                    height: 50.0 + steps * 5,
                    color: Colors.blue[900],
                  ),
                ),
              ),
              Positioned(
                  right: 50,
                  top: 300,
                  child: FloatingActionButton(onPressed: () {
                    if (!isTime) {
                      update();
                      isTime = true;
                    }
                  }))
            ],
          )),
    );
  }
}
