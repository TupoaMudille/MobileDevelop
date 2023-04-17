import 'package:flutter/material.dart';

int index = 0;

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Страница $index'),
          automaticallyImplyLeading: false,
        ),
        body: Column(children: [
          Text('глубина стека $index'),
          TextButton(
              onPressed: () {
                index++;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
              child: Text('вперед')),
          TextButton(
            child: Text('назад'),
            onPressed: () {
              if (index > 0) {
                index--;
                Navigator.pop(context);
              }
            },
          ),
        ]));
  }
}
