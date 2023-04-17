import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URL Launcher"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("Открыть Mangalib"),
            onTap: () async {
              const url = 'https://mangalib.me/?section=home-updates';

              if (await canLaunch(url)) {
                await launch(url, forceSafariVC: false);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        ],
      ),
    );
  }
}
