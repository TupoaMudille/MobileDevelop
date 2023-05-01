import 'package:flutter/material.dart';
import 'package:colornames/colornames.dart';

class Task2 extends StatefulWidget {
  const Task2({Key? key}) : super(key: key);

  @override
  State<Task2> createState() => _Task2State();
}

class _Item {
  late int _i;

  _Item(this._i);

  int get i => _i;
}

class _Task2State extends State<Task2> {
  List<_Item> _items = List<_Item>.generate(2, (i) => _Item(i));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task2'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _items.insert(_items.length, _Item(_items.length));
                    });
                  },
                  child: Text('Добавить')),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _items.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            _items.removeAt(i);
                          });
                        },
                        child: Container(
                            height: 80,
                            color: Color.fromARGB(255, 120, 164, 194),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('${_items[i].i}'),
                            )));
                  },
                ),
              )
            ],
          ),
        ));
  }
}
