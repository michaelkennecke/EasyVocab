import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferences"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.engineering,
              size: 70,
            ),
            Text(
              "Comming Soon!",
            ),
          ],
        ),
      ),
    );
  }
}
