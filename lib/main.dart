import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Vocab Trainer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Vocab"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.create),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.all_inbox),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.model_training),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.emoji_events),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
