import 'package:easy_vocab/routes/boxSelection.dart';
import 'package:easy_vocab/routes/home.dart';
import 'package:easy_vocab/routes/exam.dart';
import 'package:easy_vocab/routes/preferences.dart';
import 'package:easy_vocab/routes/train.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String trainPage = '/train';
  static const String examPage = '/exam';
  static const String boxSelectionPage = '/boxSelection';
  static const String preferencesPage = '/preferences';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case trainPage:
        return MaterialPageRoute(
          builder: (_) => const TrainPage(),
        );

      case examPage:
        return MaterialPageRoute(
          builder: (_) => const ExamPage(),
        );

      case boxSelectionPage:
        return MaterialPageRoute(
          builder: (_) => const BoxSelectionPage(),
        );

      case preferencesPage:
        return MaterialPageRoute(
          builder: (_) => const PreferencesPage(),
        );

      default:
        throw FormatException("Route not found!");
    }
  }
}
