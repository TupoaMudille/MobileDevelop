import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task6 extends StatefulWidget {
  const Task6({Key? key}) : super(key: key);

  @override
  State<Task6> createState() => _Task6State();
}

class _Task6State extends State<Task6> {
  late TextEditingController _controller;
  late List<String> _notes = [];
  void _loadNotes() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _notes = (prefs.getStringList('notes') ?? []);
    });
  }

  void _uploadNotes(String note) async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _notes = prefs.getStringList('notes') ?? [];
      _notes.add(note);
      prefs.setStringList('notes', _notes);
    });
  }

  void _removeNotes(String note) async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _notes = prefs.getStringList('notes') ?? [];
      if (_notes.isNotEmpty) _notes.remove(note);
      prefs.setStringList('notes', _notes);
    });
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
        ));
  }
}
