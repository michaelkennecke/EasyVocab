import 'package:easy_vocab/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_vocab/translation_model.dart';
import 'package:easy_vocab/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    //gives you the instance of the Provider which gives you access to the model object
    final translator = Provider.of<TranslationModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Vocab Trainer"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.all_inbox),
            onPressed: () =>
                Navigator.of(context)?.pushNamed(RouteGenerator.trainPage),
            tooltip: "Boxes",
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () =>
                Navigator.of(context)?.pushNamed(RouteGenerator.trainPage),
            tooltip: "Settings",
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          TranslationInputWidget(translator.newTranslation),
          Expanded(
            child: TranslationList(
                translator.translations, translator.removeTranslation),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
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
            prefixIcon: Icon(Icons.arrow_forward),
            hintText: "Enter word",
          ),
        ),
        TextField(
          controller: this.wordTranslatedController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.arrow_back),
            hintText: "Enter translation",
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: FloatingActionButton(
            onPressed: this.click,
            child: Icon(Icons.translate),
          ),
        ),
      ],
    );
  }
}

class TranslationList extends StatefulWidget {
  final List<Translation> listItems;
  final Function(int) callback;

  // constructor
  TranslationList(this.listItems, this.callback);

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
          child: Row(
            children: [
              Expanded(
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
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => widget.callback(index),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
