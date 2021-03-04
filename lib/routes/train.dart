import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../translation_model.dart';
import 'package:flip_card/flip_card.dart';

class TrainPage extends StatelessWidget {
  const TrainPage();

  @override
  Widget build(BuildContext context) {
    final translator = Provider.of<TranslationModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Vocabulary"),
      ),
      body: TrainCards(translator),
      // bottomNavigationBar: Footer(),
    );
  }
}

class TrainCards extends StatefulWidget {
  final TranslationModel translator;

  TrainCards(this.translator);

  @override
  _TrainCardsState createState() => _TrainCardsState();
}

class _TrainCardsState extends State<TrainCards> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${widget.translator.index + 1}/ ${widget.translator.translations.length}",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          ),
          TranslationFlipCardWidget(
              widget.translator.getTranslationAtCurrentIndex().word,
              widget.translator.getTranslationAtCurrentIndex().wordTranslated),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 50,
                onPressed: () => widget.translator.getPreviousTranslation(),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 50,
                onPressed: () => widget.translator.getNextTranslation(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// The (flip)-Card is created in a seperaded Widget to make code more readable
class TranslationFlipCardWidget extends StatelessWidget {
  final word;
  final wordTranslated;

  TranslationFlipCardWidget(this.word, this.wordTranslated);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Container(
        height: 180,
        width: 250,
        child: Center(
          child: Text(
            word,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        color: Colors.cyan,
      ),
      back: Container(
        height: 180,
        width: 250,
        child: Center(
          child: Text(
            wordTranslated,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        color: Colors.blueGrey,
      ),
    );
  }
}
