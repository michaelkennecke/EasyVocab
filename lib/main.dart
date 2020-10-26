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
  List<Translation> translations = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void newTranslation(String word, String wordTranslated) {
    this.setState(() {
      translations.add(new Translation(word, wordTranslated));
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
          TranslationInputWidget(this.newTranslation),
          Expanded(child: TranslationList(this.translations)),
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

class Box {
  int id;
  String name;
  List<Translation> translations;
  bool selected = false;
}

class Translation {
  String word;
  String wordTranslated;

  Translation(this.word, this.wordTranslated);
}

class TranslationInputWidget extends StatefulWidget {
  final Function(String, String) callback;

  TranslationInputWidget(this.callback);

  @override
  _TranslationInputWidgetState createState() => _TranslationInputWidgetState();
}

class _TranslationInputWidgetState extends State<TranslationInputWidget> {
  final wordController = TextEditingController();
  final wordTranslatedController = TextEditingController();

  void click() {
    widget.callback(wordController.text, wordTranslatedController.text);
    FocusScope.of(context).unfocus();
    wordController.clear();
    wordTranslatedController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: this.wordController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.translate),
            hintText: "Enter vocab",
          ),
        ),
        TextField(
          controller: this.wordTranslatedController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.translate),
            hintText: "Enter translation",
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: FloatingActionButton(
            onPressed: this.click,
            child: Icon(Icons.send),
          ),
        ),
      ],
    );
  }
}

class TranslationList extends StatefulWidget {
  final List<Translation> listItems;

  // constructor
  TranslationList(this.listItems);

  @override
  _TranslationListState createState() => _TranslationListState();
}

class _TranslationListState extends State<TranslationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      itemCount: this.widget.listItems.length,
      itemBuilder: (BuildContext context, int index) {
        var translation = this.widget.listItems[index];
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                translation.word,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                translation.wordTranslated,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
