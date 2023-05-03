import 'package:flutter/material.dart';

class App2 extends StatefulWidget {
  const App2({Key? key}) : super(key: key);

  @override
  State<App2> createState() => _App2State();
}

class ListOwner {
  final List<String> _list = [];
  final String vowels = "aeiou";

  void append(String string) => _list.add(string.toLowerCase());

  void remove() {
    if (_list.isNotEmpty) _list.removeLast();
  }

  String getAll() => _list.isEmpty
      ? ''
      : _replaceCharAt(_list.join(', '), 0, _list.join(', ')[0].toUpperCase());

  String _replaceCharAt(String old, int i, String set) =>
      old.substring(0, i) + set + old.substring(i + 1);

  int getVowels() {
    int _count = 0;
    for (int i = 0; i < _list.length; i++) {
      for (int j = 0; j < vowels.length; j++) {
        _count += vowels[j].allMatches(_list[i].toLowerCase()).length;
      }
    }
    return _count;
  }
}

class _App2State extends State<App2> {
  final ListOwner _listOwner = ListOwner();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
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
          title: const Text('TextList2'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                ),
                ElevatedButton(
                    onPressed: () => setState(() {
                          if (_controller.text.isNotEmpty)
                            _listOwner.append(_controller.text);
                          _controller.text = '';
                        }),
                    child: const Text('Добавить')),
                ElevatedButton(
                    onPressed: () => setState(() {
                          _listOwner.remove();
                        }),
                    child: const Text('Удалить последнего')),
                Text(_listOwner.getAll()),
                //Text('${_listOwner.getVowels()}')
              ],
            ),
          ),
        ));
  }
}
