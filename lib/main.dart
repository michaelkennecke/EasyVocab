import 'package:easy_vocab/providers/box_collection_model.dart';
import 'package:easy_vocab/providers/box_model.dart';
import 'package:easy_vocab/providers/exam_box_model.dart';
import 'package:easy_vocab/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BoxModel()),
        ChangeNotifierProvider(create: (_) => ExamBoxModel()),
        ChangeNotifierProvider(create: (_) => BoxCollectionModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deep Vocab',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Color(0xFFB81d4fa),
      ),
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
