import 'dart:convert';

import 'package:easy_vocab/models/BoxScaffold.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum languages { English, German, French, Spanish, Turkish }
enum languages_shortcuts { en, de, fr, sp, tk }
enum flags { gb, de, fr, sp, tk }

class BoxCollectionModel with ChangeNotifier {
  static const BOX_COLLECTION_NAME = "BoxCollection";
  static const DEFAULT_BOX_NAME = "DefaultBox";
  static const DEFAULT_BOX_TRANSLATE_FROM_LANGUAGE = "English";
  static const DEFAULT_BOX_TRANSLATE_TO_LANGUAGE = "German";

  SharedPreferences sharedPreferences;
  List<BoxScaffold> boxCollection = [];
  int currentIndex;
  String selectedBoxName;

  void addBoxScaffoldToBoxCollection(
      String boxName, String translateFromLanguage, String translateToLanaguage,
      [int fillGrade = 0]) {
    boxCollection.add(BoxScaffold(
        boxName, translateFromLanguage, translateToLanaguage, fillGrade));
    saveData();
    notifyListeners();
  }

  void removeBoxScaffold(int deletionIndex) {
    if (boxCollection[deletionIndex].boxName == selectedBoxName) {
      selectedBoxName = DEFAULT_BOX_NAME;
    }
    if (deletionIndex == currentIndex) {
      currentIndex = 0;
    }
    boxCollection.removeAt(deletionIndex);
    saveData();
    notifyListeners();
  }

  void changeSelectedBox(String name, int index) {
    currentIndex = index;
    selectedBoxName = name;
    saveData();
    notifyListeners();
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
    notifyListeners();
    print("CurrentIndex: $currentIndex"); //TODO:
  }

  void loadLastSelected() async {
    var tmpSelected = sharedPreferences.getString("selected");
    var tmpCurrentIndex = sharedPreferences.getInt("currentIndex");
    if (tmpSelected == null || tmpSelected == " ") {
      selectedBoxName = DEFAULT_BOX_NAME;
      currentIndex = 0;
    } else {
      selectedBoxName = tmpSelected;
      currentIndex = tmpCurrentIndex;
    }
  }

  void loadData() async {
    var tmpSelected = sharedPreferences.getString("selected");
    var tmpCurrentIndex = sharedPreferences.getInt("currentIndex");
    if (tmpSelected == null || tmpSelected == " ") {
      selectedBoxName = DEFAULT_BOX_NAME;
      currentIndex = 0;
    } else {
      selectedBoxName = tmpSelected;
      currentIndex = tmpCurrentIndex;
    }
    //print("Selected: $tmpSelected");
    List<String> listString =
        sharedPreferences.getStringList(BOX_COLLECTION_NAME);
    if (listString != null) {
      var tmpBoxCollection = listString
          .map((item) => BoxScaffold.fromMap(json.decode(item)))
          .toList();
      boxCollection = tmpBoxCollection;
      if (boxCollection.isEmpty) {
        this.addBoxScaffoldToBoxCollection(
            DEFAULT_BOX_NAME,
            DEFAULT_BOX_TRANSLATE_FROM_LANGUAGE,
            DEFAULT_BOX_TRANSLATE_TO_LANGUAGE);
      }
    }
  }

  void saveData() {
    sharedPreferences.setString("selected", selectedBoxName);
    sharedPreferences.setInt("currentIndex", currentIndex);
    List<String> stringList =
        this.boxCollection.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList(BOX_COLLECTION_NAME, stringList);
  }
}
