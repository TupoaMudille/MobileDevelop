import 'package:flutter/material.dart';
import 'package:lab1/labs/lab5/3.dart';

String picked = "";

class NavBar extends StatelessWidget {
  final ScrollController controller;

  const NavBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: controller,
        children: [
          buildAboutText(context),
        ],
      );

  Widget buildAboutText(context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  picked = 'favourite';
                  Navigator.popAndPushNamed(context, '/', arguments: picked);
                },
                child: Text('favourite')),
            TextButton(
                onPressed: () {
                  picked = 'about';
                  Navigator.popAndPushNamed(context, '/', arguments: picked);
                },
                child: Text('about')),
            TextButton(
                onPressed: () {
                  picked = 'settings';
                  Navigator.popAndPushNamed(context, '/', arguments: picked);
                },
                child: Text('settings')),
          ],
        ),
      );
}
