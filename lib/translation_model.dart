import 'package:flutter/widgets.dart';
import 'package:easy_vocab/routes/home.dart';

class TranslationModel with ChangeNotifier {
  List<Translation> translations = [];

  void newTranslation(String word, String wordTranslated) {
    translations.add(new Translation(word, wordTranslated));
    notifyListeners();
  }

  void removeTranslation(int index) {
    translations.removeAt(index);
    notifyListeners();
  }
}
