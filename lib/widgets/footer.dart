import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer();

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
