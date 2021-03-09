import 'package:easy_vocab/models/translation.dart';
import 'package:easy_vocab/providers/box_model.dart';
import 'package:easy_vocab/providers/exam_box_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  const TestPage();

  @override
  Widget build(BuildContext context) {
    final boxModel = Provider.of<BoxModel>(context, listen: false);
    final examBoxModel = Provider.of<ExamBoxModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            examBoxModel.reset();
            Navigator.pop(context);
          },
        ),
        title: Text("Vocabulary Test ${examBoxModel.box.length} "),
      ),
      body: Column(
        children: <Widget>[
          TestBody(examBoxModel, boxModel.box),
        ],
      ),
    );
  }
}

class TestBody extends StatefulWidget {
  final ExamBoxModel examBoxModel;
  final List<Translation> standardBox;

  TestBody(this.examBoxModel, this.standardBox);

  @override
  _TestBodyState createState() => _TestBodyState();
}

class _TestBodyState extends State<TestBody> {
  final answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.examBoxModel.initBox(widget.standardBox);
      widget.examBoxModel.shuffleBox();
      widget.examBoxModel.printBox();
    });
  }

  Widget getAnswerWidget(int answerStatus) {
    switch (answerStatus) {
      case 0:
        {
          return null;
        }
        break;

      case 1:
        {
          return CorecctAnswer();
        }
        break;

      case -1:
        {}
        break;
      default:
        {}
    }
  }

  @override
  Widget build(BuildContext context) {
    var answerTextFieldFocusNode = FocusNode();
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(5, 50, 5, 20),
            child: LinearPercentIndicator(
              width: 320.0,
              lineHeight: 30.0,
              percent: widget.examBoxModel.getPercentageOfExamCompletion(),
              center: Text(
                  "${(widget.examBoxModel.getPercentageOfExamCompletion() * 100).toStringAsFixed(0)} %"),
              backgroundColor: Colors.grey,
              progressColor: Colors.cyan,
              alignment: MainAxisAlignment.center,
            ),
          ),
          IconButton(
            icon: Icon(Icons.replay),
            iconSize: 60,
            onPressed: () => {widget.examBoxModel.reset()},
          ),
          Text("Restart"),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 120, 5, 0),
            child: Text(
              widget.examBoxModel.getTranslationAtCurrentIndex().word,
              style: TextStyle(fontSize: 32),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 80, 10, 10),
            child: getAnswerWidget(widget.examBoxModel.answerStatus),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(100, 100, 100, 0),
            child: TextField(
              focusNode: answerTextFieldFocusNode,
              autofocus: true,
              controller: this.answerController,
              onSubmitted: (value) => {
                if (widget.examBoxModel.checkAnswer(value))
                  {widget.examBoxModel.answerStatus = 1}
                else
                  {widget.examBoxModel.answerStatus = -1},
                widget.examBoxModel.getNextTranslation(),
                this.answerController.clear(),
                answerTextFieldFocusNode.requestFocus(),
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.question_answer),
                hintText: "Enter your answer",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CorecctAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(Icons.check),
        Text("Correct!"),
      ],
    );
  }
}
