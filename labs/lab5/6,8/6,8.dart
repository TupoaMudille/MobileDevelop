import 'package:flutter/material.dart';

class MainScreen68 extends StatefulWidget {
  @override
  _MainScreen68State createState() => _MainScreen68State();
}

class _MainScreen68State extends State<MainScreen68> {
  List<Map<String, dynamic>> todo_list = [
    {'name': 'Green', 'date': '2020-06-30'},
    {'name': 'Blue', 'date': '2020-08-27'},
    {'name': 'Purple', 'date': '2020-08-23'},
  ];

  @override
  void initState() {
    todo_list
        .sort(((a, b) => (a['date'] as String).compareTo(b['date'] as String)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todo"),
      ),
      body: ListView.builder(
        itemCount: todo_list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              trailing: Text(todo_list[index]['date']),
              title: Text(todo_list[index]['name']),
            ),
          );
        },
      ),
    );
  }
}
