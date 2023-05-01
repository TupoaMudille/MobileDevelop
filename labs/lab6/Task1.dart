import 'package:flutter/material.dart';
import 'package:colornames/colornames.dart';

class Task1 extends StatefulWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  State<Task1> createState() => _Task1State();
}

class _Item {
  late Color _containerColor;
  late Color _textColor;
  late String _text = ColorNames.guess(_containerColor);

  _Item(this._containerColor, this._textColor);

  String get text => _text;
  Color get textColor => _textColor;
  Color get containerColor => _containerColor;
}

class _Task1State extends State<Task1> {
  List<_Item> _items = [
    _Item(Colors.black, Colors.white),
    _Item(Colors.white, Colors.black),
    _Item(Color.fromARGB(255, 26, 53, 203), Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task1'),
        ),
        body: SizedBox(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, i) {
              return Container(
                  height: 80,
                  color: _items[i].containerColor,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      _items[i].text,
                      style:
                          TextStyle(color: _items[i].textColor, fontSize: 17.0),
                    ),
                  ));
            },
          ),
        ));
  }
}
