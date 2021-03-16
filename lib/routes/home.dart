import 'dart:ffi';

import 'package:easy_vocab/providers/box_collection_model.dart';
import 'package:easy_vocab/providers/box_model.dart';
import 'package:easy_vocab/providers/exam_box_model.dart';
import 'package:easy_vocab/widgets/footer.dart';
import 'package:easy_vocab/widgets/translation_input_home.dart';
import 'package:easy_vocab/widgets/translation_list_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_vocab/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BoxModel boxModel;
  BoxCollectionModel boxCollectionModel;
  ExamBoxModel examBoxModel;

  void refreshData() {
    boxModel.setBoxIdFromSelectedBox(boxCollectionModel.selectedBoxName);
    examBoxModel.setBoxIdFromSelectedBox(boxCollectionModel.selectedBoxName);
    boxModel.loadSharedPreferencesAndData();
    examBoxModel.loadSharedPreferencesAndData();
  }

  @override
  Widget build(BuildContext context) {
    //gives you the instance of the Provider which gives you access to the model object
    boxModel = Provider.of<BoxModel>(context, listen: true);
    examBoxModel = Provider.of<ExamBoxModel>(context, listen: true);
    boxCollectionModel = Provider.of<BoxCollectionModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Deep Vocab"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.all_inbox),
            onPressed: () => Navigator.of(context)
                ?.pushNamed(RouteGenerator.boxSelectionPage)
                .whenComplete(() => refreshData()),
            tooltip: "Boxes",
          ),
          /*IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.of(context)
                ?.pushNamed(RouteGenerator.preferencesPage),
            tooltip: "Settings",
          ),*/
        ],
      ),
      body: Column(
        children: <Widget>[
          TranslationInputWidget(boxModel.addTranslation,
              examBoxModel.addTranslation, boxCollectionModel),
          Expanded(
            child: TranslationList(boxModel, examBoxModel, boxCollectionModel),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
