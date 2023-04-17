import 'package:flutter/material.dart';

class MainScreen10 extends StatefulWidget {
  const MainScreen10({Key? key}) : super(key: key);

  @override
  State<MainScreen10> createState() => _MainScreen10State();
}

class _MainScreen10State extends State<MainScreen10> {
  String selectedResult = "";
  final List<String> names = [
    'Liam',
    'Noah',
    'Oliver',
    'William',
    'Elijah',
    'James',
    'Benjamin',
    'Lucas',
    'Mason',
    'Ethan',
    'Alexander'
  ];
  Offset _tapPosition = Offset.zero;
  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  // This function will be called when you long press on the blue box or the image
  void _showContextMenu(BuildContext context) async {
    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();

    final result = await showMenu(
      context: context,
      position: RelativeRect.fromRect(
          Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
          Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
              overlay.paintBounds.size.height)),
      items: names.map((String name) {
        return new PopupMenuItem<String>(
          child: new Text(name),
          value: name,
        );
      }).toList(),
    );
    if (result != null) {
      setState(() {
        print(result);
        print(names.indexOf(result));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List+menu')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            GestureDetector(
              // get tap location
              onTapDown: (details) => _getTapPosition(details),
              // show the context menu
              onLongPress: () => _showContextMenu(context),
              child: Container(
                width: double.infinity,
                height: 200,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'зажми',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
