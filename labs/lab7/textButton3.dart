import 'package:flutter/material.dart';
import 'package:lab1/labs/lab5/3.dart';

class TextButton3 extends StatefulWidget {
  const TextButton3({Key? key}) : super(key: key);
  @override
  State<TextButton3> createState() => _TextButton3State();
}

class Component extends StatefulWidget {
  final Text temptext;
  final Color tempcolor;
  Component({super.key, required Text text, required Color color})
      : temptext = text,
        tempcolor = color;
  @override
  State<Component> createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
  Text temptext = Text("некоторое значение");
  Color tempcolor = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //TextField(
        //onSubmitted: (text) {
        //setState(() {
        //temptext = Text(text);
        //});
        //},
        //decoration: InputDecoration(hintText: 'Введите'),
        //),
        ElevatedButton(
            onPressed: () {},
            child: temptext,
            style: ElevatedButton.styleFrom(backgroundColor: tempcolor))
      ],
    );
  }
}

class _TextButton3State extends State<TextButton3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TextButton'),
        ),
        body: Center(
          child: Component(
            text: Text(""),
            color: Colors.blue,
          ),
        ));
  }
}
