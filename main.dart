import 'package:flutter/material.dart';
import 'package:lab1/labs/lab12.dart';
import 'package:lab1/labs/lab3.dart';
import 'package:lab1/labs/lab4.dart';
import 'package:lab1/labs/datetimelab4.dart';
import 'package:lab1/labs/showdialoglab3.dart';
import 'package:lab1/labs/lab5/1.dart';
import 'package:lab1/labs/lab5/2.dart';
import 'package:lab1/labs/lab5/3.dart';
import 'package:lab1/labs/lab5/11.dart';
import 'package:lab1/labs/lab5/7.dart';
import 'package:lab1/labs/lab5/10.dart';
import 'package:lab1/labs/lab5/6,8/6,8.dart';
import 'package:lab1/labs/lab5/9/mainscreen9.dart';

//4 и 5 задания из 5 лабы есть в datetimelab4
void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (BuildContext context) => MainScreen68(),
    '/second': (BuildContext context) => SecondScreen()
  }));
}
