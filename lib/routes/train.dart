import 'package:easy_vocab/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TrainPage extends StatelessWidget {
  const TrainPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Vocab"),
      ),
      body: Center(
        child: Text("Train Page"),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
