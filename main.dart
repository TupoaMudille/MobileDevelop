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
import 'package:lab1/labs/lab5/8.dart';
import 'package:lab1/labs/lab5/6,8/6,8.dart';
import 'package:lab1/labs/lab5/9/mainscreen9.dart';
import 'package:lab1/labs/lab6/Task1.dart';
import 'package:lab1/labs/lab6/Task2.dart';
import 'package:lab1/labs/lab6/Task3.dart';
import 'package:lab1/labs/lab6/Task4.dart';
import 'package:lab1/labs/lab6/Task5.dart';
import 'package:lab1/labs/lab7/traffic1.dart';
import 'package:lab1/labs/lab7/text2.dart';
import 'package:lab1/labs/lab7/textButton3.dart';
import 'package:lab1/labs/lab7/stopwatchShower4.dart';
import 'package:provider/provider.dart';

//Text2(height: MediaQuery.of(context).size.height,)
//MainScreen(index: 0, countAdd: 0, countMinus: 0) счетчик страниц для лабы 7
//4 и 5 задания из 5 лабы есть в datetimelab4
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(onGenerateRoute: generateRoute);
  }
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => App5());
    case '/second':
      return MaterialPageRoute(builder: (context) => SecondScreen());
    default:
      return MaterialPageRoute(builder: (context) => MainScreen2());
  }
}
