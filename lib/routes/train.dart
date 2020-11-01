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
      body: TrainCards(),
      bottomNavigationBar: Footer(),
    );
  }
}

class TrainCards extends StatefulWidget {
  @override
  _TrainCardsState createState() => _TrainCardsState();
}

class _TrainCardsState extends State<TrainCards> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 120,
            width: 180,
            child: RaisedButton(
              child: Text(
                "Sample",
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () {},
              color: Colors.cyan,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 50,
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 50,
                onPressed: () => {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
