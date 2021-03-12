import 'package:flutter/material.dart';

class TranslationInputWidget extends StatefulWidget {
  final Function(String, String) callback;
  final Function(String, String) examBoxModelCallback;

  TranslationInputWidget(this.callback, this.examBoxModelCallback);

  @override
  _TranslationInputWidgetState createState() => _TranslationInputWidgetState();
}

class _TranslationInputWidgetState extends State<TranslationInputWidget> {
  final wordController = TextEditingController();
  final wordTranslatedController = TextEditingController();

  void addItemToBox() {
    widget.callback(wordController.text, wordTranslatedController.text);
    widget.examBoxModelCallback(
        wordController.text, wordTranslatedController.text);
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
            backgroundColor: const Color(0xFFFFD740),
            //backgroundColor: Colors.amberAccent,
            splashColor: Colors.amberAccent,
            onPressed: this.addItemToBox,
            child: Icon(Icons.translate),
          ),
        ),
      ],
    );
  }
}
