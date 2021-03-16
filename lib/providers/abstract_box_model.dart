import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_vocab/providers/box_collection_model.dart';

import '../models/translation.dart';

abstract class AbstractBoxModel with ChangeNotifier {
  String boxId;
  List<Translation> box = [];
  int index = 0;
  SharedPreferences sharedPreferences;

  void setBoxIdFromSelectedBox(String name) {
    boxId = name;
    notifyListeners();
  }

  void addTranslation(String word, String wordTranslated) {
    box.add(Translation(word, wordTranslated));
    saveData();
    notifyListeners();
  }

  void removeTranslation(int deletionIndex) {
    this.index = 0;
    box.removeAt(deletionIndex);
    saveData();
    notifyListeners();
  }

  Translation getTranslationAtCurrentIndex() {
    if (box.isNotEmpty) {
      return box.elementAt(index);
    } else {
      index = 0;
      return Translation("-", "-");
    }
  }

  Translation getNextTranslation() {
    if (index >= box.length - 1) {
      index = 0;
    } else {
      index++;
    }
    notifyListeners();
    return getTranslationAtCurrentIndex();
  }

  Translation getPreviousTranslation() {
    if (index <= 0) {
      index = box.length - 1;
    } else {
      index--;
    }
    notifyListeners();
    return getTranslationAtCurrentIndex();
  }

  void reset() {
    index = 0;
    notifyListeners();
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
    notifyListeners();
  }

  void loadData() async {
    var tmpSelected = sharedPreferences.getString("selected");
    if (tmpSelected == null || tmpSelected == "") {
      boxId = BoxCollectionModel.DEFAULT_BOX_NAME;
    } else {
      boxId = tmpSelected;
    }
    List<String> listString = sharedPreferences.getStringList(this.boxId);
    if (listString != null) {
      var tmpBox = listString
          .map((item) => Translation.fromMap(json.decode(item)))
          .toList();
      box = tmpBox;
    }
  }

  void saveData() {
    sharedPreferences.setString("selected", boxId);
    List<String> stringList =
        this.box.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList(this.boxId, stringList);
  }
}
