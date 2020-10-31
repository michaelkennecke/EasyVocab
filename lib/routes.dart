import 'package:easy_vocab/routes/home.dart';
import 'package:easy_vocab/routes/train.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String trainPage = '/train';
  static const String testPage = 'test';

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

      default:
        throw FormatException("Route not found!");
    }
  }
}
