import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final int _index;
  final int _countAdd;
  final int _countMinus;
  MainScreen(
      {super.key,
      required int index,
      required int countAdd,
      required int countMinus})
      : _index = index,
        _countAdd = countAdd,
        _countMinus = countMinus;

  int tempindex = 0;
  int tempcountAdd = 0;
  int tempcountMinus = 0;

  void initState() {
    tempindex = _index;
    tempcountAdd = _countAdd;
    tempcountMinus = _countMinus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Страница $_index'),
          automaticallyImplyLeading: false,
        ),
        body: Column(children: [
          Text('глубина стека $_index'),
          Text('сколько добавили $_countAdd'),
          Text('сколько удалили $_countMinus'),
          TextButton(
              onPressed: () {
                initState();
                tempindex++;
                tempcountAdd++;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainScreen(
                            index: tempindex,
                            countAdd: tempcountAdd,
                            countMinus: tempcountMinus)));
              },
              child: Text('Добавить')),
          TextButton(
            child: Text('Удалить'),
            onPressed: () {
              if (_index > 0) {
                initState();
                tempindex--;
                tempcountMinus++;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainScreen(
                            index: tempindex,
                            countAdd: tempcountAdd,
                            countMinus: tempcountMinus)));
              }
            },
          ),
        ]));
  }
}
