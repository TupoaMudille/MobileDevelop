import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Task4 extends StatefulWidget {
  const Task4({Key? key}) : super(key: key);

  @override
  State<Task4> createState() => _Task4State();
}

class _Task4State extends State<Task4> {
  List _values = [];

  void _xmlData() async {
    final dataList = [];
    var url = Uri.https('cbr-xml-daily.ru', 'daily_utf8.xml');
    var response = await http.get(url);
    var body = utf8.decode(response.bodyBytes);

    final document = xml.XmlDocument.parse(body);
    final valCursNode = document.findElements('ValCurs').first;
    final valuteNode = valCursNode.findElements('Valute');

    for (final valute in valuteNode) {
      final CharCode = valute.findElements('CharCode').first.text;
      final Value = valute.findElements('Value').first.text;
      final Name = valute.findElements('Name').first.text;
      dataList.add({'code': CharCode, 'value': Value, 'name': Name});
    }

    setState(() {
      _values = dataList;
    });
  }

  @override
  void initState() {
    super.initState();
    _xmlData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task4'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 120, 164, 194),
              child: Text('"https://www.cbr-xml-daily.ru/">Курсы валют, API'),
            ),
            SizedBox(
                child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(
                      _values[index]['code'] + ' ' + _values[index]['name']),
                  subtitle: Text("Курс: ${_values[index]['value']}"),
                ),
              ),
              itemCount: _values.length,
            )),
          ],
        )));
  }
}
