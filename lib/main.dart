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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Vocab"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
            tooltip: "Settings",
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.translate),
              hintText: "Enter vocab",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              //border: InputBorder.none,
              prefixIcon: Icon(Icons.translate),
              hintText: "Enter translation",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: () {
                // add code
              },
              child: Icon(Icons.send),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.model_training),
            label: "Train",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: "Test",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 30,
      ),
    );
  }
}

// Hier weitermachen: https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
