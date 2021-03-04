import 'package:flutter/widgets.dart';
import 'package:easy_vocab/routes/home.dart';

class TranslationModel with ChangeNotifier {
  List<Translation> _translations = [];
  int _index = 0;

  void addTranslation(String word, String wordTranslated) {
    _translations.add(new Translation(word, wordTranslated));
    notifyListeners();
  }

  void removeTranslation(int index) {
    this._index = 0;
    _translations.removeAt(index);
    notifyListeners();
  }

  Translation getNextTranslation() {
    if (_index >= _translations.length - 1) {
      _index = 0;
    } else {
      _index++;
    }
    notifyListeners();
    return getTranslationAtCurrentIndex();
  }

  Translation getPreviousTranslation() {
    if (_index <= 0) {
      _index = _translations.length - 1;
    } else {
      _index--;
    }
    notifyListeners();
    return getTranslationAtCurrentIndex();
  }

  int get index => _index;

  List<Translation> get translations => _translations;

  Translation getTranslationAtCurrentIndex() {
    if (_translations.isNotEmpty) {
      return translations.elementAt(_index);
    } else {
      _index = 0;
      return Translation("-", "-");
    }
  }
}
