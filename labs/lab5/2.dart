import 'package:flutter/material.dart';

class MainScreen2 extends StatefulWidget {
  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

int check = 0;
int a = 0;

@override
class _MainScreen2State extends State<MainScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главное окно')),
      body: Center(
          child: Column(
        children: [
          Text('$check'),
          TextButton(
              onPressed: () {
                if (check < 1) {
                  Navigator.pushNamed(context, '/second');
                  setState(() {
                    check++;
                  });
                  print(check);
                }
              },
              child: Text('Открыть второе окно')),
          TextButton(
              onPressed: () {
                if (check == 1) {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                  setState(() {
                    check--;
                    a = 0;
                  });
                }
                print(check);
              },
              child: Text('Закрыть второе окно')),
          TextButton(
              onPressed: () {
                if (check == 1)
                  Navigator.pushReplacementNamed(context, '/second',
                      arguments: a);
                print(check);
              },
              child: Text('Вернуться на второе окно'))
        ],
      )),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Второе окно $check')),
      body: Column(children: [
        TextButton(
            onPressed: () {
              print(check);
              Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false);
            },
            child: Text('Назад')),
        TextField(
          onSubmitted: (text) {
            setState(() {
              a = int.parse(text);
            });
          },
        ),
        Text("$a"),
      ]),
    );
  }
}
