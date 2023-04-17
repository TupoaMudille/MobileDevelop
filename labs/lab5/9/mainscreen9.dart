import 'package:flutter/material.dart';
import 'package:lab1/labs/lab5/9/9.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainScreen9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Menu"),
        ),
        body: Stack(children: [
          SlidingUpPanel(
              slideDirection: SlideDirection.UP,
              minHeight: MediaQuery.of(context).size.height * 0.01,
              maxHeight: MediaQuery.of(context).size.height * 0.3,
              panelBuilder: (controller) => NavBar(controller: controller),
              body: Center(child: Text("$picked"))),
          SlidingUpPanel(
            slideDirection: SlideDirection.DOWN,
            minHeight: MediaQuery.of(context).size.height * 0.01,
            maxHeight: MediaQuery.of(context).size.height * 0.3,
            panelBuilder: (controller1) => NavBar(controller: controller1),
            body: Center(child: Text("$picked")),
          ),
        ]));
  }
}
