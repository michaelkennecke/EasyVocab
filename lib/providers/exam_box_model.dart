import 'dart:math';

import 'package:easy_vocab/models/translation.dart';
import 'package:easy_vocab/providers/abstract_box_model.dart';

class ExamBoxModel extends AbstractBoxModel {
  var isBoxShuffled = false;
  var unshuffledBox;
  var answerStatus = 0;

  void initBox(List<Translation> newBox) {
    if (unshuffledBox == null) {
      box = newBox;
      unshuffledBox = newBox;
    }
  }

  void shuffleBox() {
    if (!isBoxShuffled) {
      box.shuffle();
      Random random = new Random();
      for (var translation in box) {
        var changeOrder = random.nextBool();
        if (changeOrder) {
          var tmpWord = translation.word;
          translation.word = translation.wordTranslated;
          translation.wordTranslated = tmpWord;
        }
      }
      isBoxShuffled = true;
      notifyListeners();
    } else {
      return;
    }
  }

  @override
  void reset() {
    index = 0;
    box = unshuffledBox;
    isBoxShuffled = false;
    notifyListeners();
  }

  double getPercentageOfExamCompletion() {
    return index / box.length;
  }

  bool checkAnswer(String answer) {
    if (answer == this.getTranslationAtCurrentIndex().wordTranslated) {
      return true;
    } else {
      return false;
    }
  }

  void printBox() {
    for (var translation in box) {
      print(
          "Word: ${translation.word} | Translation: ${translation.wordTranslated}");
    }
    print("");
  }
}
