import 'package:easy_vocab/routes.dart';
import 'package:flutter/material.dart';

/// At the moment this class routes not perfectly

class Footer extends StatefulWidget {
  const Footer();

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final List<String> _routes = [
    RouteGenerator.homePage,
    RouteGenerator.trainPage,
    RouteGenerator.examPage,
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      return;
    } else {
      setState(() {
        Navigator.of(context)?.pushNamed(_routes.elementAt(index));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
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
      //currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      iconSize: 30,
      selectedItemColor: const Color(0xFFB81d4fa),
    );
  }
}
