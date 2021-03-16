import 'package:easy_vocab/providers/box_collection_model.dart';
import 'package:easy_vocab/providers/box_model.dart';
import 'package:easy_vocab/widgets/box_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BoxSelectionPage extends StatelessWidget {
  const BoxSelectionPage();

  void addBox() {}

  @override
  Widget build(BuildContext context) {
    final boxCollectionModel =
        Provider.of<BoxCollectionModel>(context, listen: true);
    final boxModel = Provider.of<BoxModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Boxes"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            const Color(0xFFBffd265), // Alternative color: 0xFFFFD740
        splashColor: Colors.amberAccent,
        child: Icon(Icons.add),
        onPressed: () => {
          boxCollectionModel.addBoxScaffoldToBoxCollection(
              "Daily Vocabs", "English", "German", 0)
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: BoxCollectionWidget(boxCollectionModel, boxModel),
          ),
        ],
      ),
    );
  }
}
