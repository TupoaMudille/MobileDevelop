import 'dart:async';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task4 extends StatefulWidget {
  const Task4({Key? key}) : super(key: key);

  @override
  State<Task4> createState() => _Task4State();
}

class _Task4State extends State<Task4> {
  var connection = PostgreSQLConnection("10.0.2.2", 5432, "Mobile",
      username: "postgres", password: "root");
  late TextEditingController _controller;
  late List<String> _notes = [];
  void _loadNotes() async {
    if (connection.isClosed) {
      await connection.open();
    }
    var prefs = await connection.query("SELECT * FROM notes");
    List<String> notations = [];
    for (var row in prefs) {
      notations.add(row[1]);
    }
    setState(() {
      _notes = notations;
    });
  }

  void _uploadNotes(String note) async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      connection.query("INSERT INTO notes(note) VALUES (\'" + note + "\')");
      _loadNotes();
    });
  }

  void _removeNotes(String note) async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      connection.query("DELETE FROM notes WHERE notes.note = \'" + note + "\'");
    });
    _loadNotes();
  }

  void _anotherInit() async {
    await connection.open();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _loadNotes();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task6'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _controller,
            ),
            ElevatedButton(
                onPressed: () {
                  _uploadNotes(_controller.text);
                },
                child: Text('Добавить')),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _notes.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap: () {
                      setState(() {
                        _removeNotes(_notes[i]);
                      });
                    },
                    title: Text(_notes[i]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
