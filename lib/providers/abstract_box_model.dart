import 'package:flutter/material.dart';

import '../models/translation.dart';

abstract class AbstractBoxModel with ChangeNotifier {
  List<Translation> _box = [];
  int index = 0;

  List<Translation> get box => _box;

  set box(List<Translation> box) {
    box = box;
    notifyListeners();
  }

  void addTranslation(String word, String wordTranslated) {
    box.add(Translation(word, wordTranslated));
    notifyListeners();
  }

  void removeTranslation(int index) {
    index = 0;
    box.removeAt(index);
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
}
