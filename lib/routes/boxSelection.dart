import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BoxSelectionPage extends StatelessWidget {
  const BoxSelectionPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Box Selection"),
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
