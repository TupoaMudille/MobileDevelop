import 'package:flutter/material.dart';
import 'package:lab1/labs/showdialoglab3.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Task3 extends StatefulWidget {
  const Task3({Key? key}) : super(key: key);

  @override
  State<Task3> createState() => _Task3State();
}

class _Task3State extends State<Task3> {
  List _values = [];

  void _xmlData() async {
    final dataList = [];
    final fullDataList = [];
    var url = Uri.https('cbr-xml-daily.ru', 'daily_utf8.xml');
    var response = await http.get(url);
    var body = utf8.decode(response.bodyBytes);

    final document = xml.XmlDocument.parse(body);
    final valCursNode = document.findElements('ValCurs').first;
    final valuteNode = valCursNode.findElements('Valute');

    for (final valute in valuteNode) {
      final NumCode = valute.findAllElements('NumCode').first.text;
      final CharCode = valute.findElements('CharCode').first.text;
      final Nominal = valute.findElements('Nominal').first.text;
      final Value = valute.findElements('Value').first.text;
      final Name = valute.findElements('Name').first.text;

      dataList.add({
        'NumCode': NumCode,
        'code': CharCode,
        'Nominal': Nominal,
        'value': Value,
        'name': Name
      });
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

  void _showMaterialDialog(String text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(''),
            content: Text(text),
            actions: <Widget>[],
          );
        });
  }

  String text = '';
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
                  child: TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    ListTile(
                      title: Text(_values[index]['code'] +
                          ' ' +
                          _values[index]['name']),
                      subtitle: Text("Курс: ${_values[index]['value']}"),
                      onTap: () => setState(() {
                        text = "${_values[index]['code']}" +
                            '\n' +
                            "${_values[index]['name']}" +
                            '\n ' +
                            "\nNumCode: " +
                            _values[index]['NumCode'] +
                            ' ' +
                            "\nNominal: " +
                            _values[index]['Nominal'] +
                            "\n" +
                            "Курс: ${_values[index]['value']}";
                        _showMaterialDialog(text);
                      }),
                    ),
                  ],
                ),
              )),
              itemCount: _values.length,
            )),
          ],
        )));
  }
}
