import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task7 extends StatefulWidget {
  const Task7({Key? key}) : super(key: key);

  @override
  State<Task7> createState() => _Task7State();
}

class _Task7State extends State<Task7> {
  late TextEditingController _controller;
  late bool _switcher = true;
  late String _text;

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _text = (prefs.getString('text') ?? "");
      _controller.text = _text;
      _switcher = (prefs.getBool('switcher') ?? false);
    });
  }

  void _uploadSwitcher(bool switcher) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _switcher = (prefs.getBool('switcher') ?? false);
      _switcher = switcher;
      prefs.setBool('switcher', _switcher);
    });
  }

  void _uploadText(String text) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _text = (prefs.getString('text') ?? "");
      _text = text;
      _controller.text = _text;
      prefs.setString('text', _text);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _loadSettings();
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
        title: const Text('Task7'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              _uploadText(value);
            },
          ),
          Switch(
            onChanged: (value) {
              _uploadSwitcher(value);
            },
            value: _switcher,
          ),
        ],
      ),
    );
  }
}
