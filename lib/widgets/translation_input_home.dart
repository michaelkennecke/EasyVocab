import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslationInputWidget extends StatefulWidget {
  final Function(String, String) callback;
  final Function(String, String) examBoxModelCallback;

  TranslationInputWidget(this.callback, this.examBoxModelCallback);

  @override
  _TranslationInputWidgetState createState() => _TranslationInputWidgetState();
}

class _TranslationInputWidgetState extends State<TranslationInputWidget> {
  final wordController = TextEditingController();
  final wordTranslatedController = TextEditingController();
  final translator = GoogleTranslator();

  FocusNode _focusWordInput = FocusNode();
  FocusNode _focusWordTranslatedInput = FocusNode();
  var _wordInputSelected = false;
  var _wordTranslatedInputSelected = false;

  @override
  void initState() {
    super.initState();
    _focusWordInput.addListener(() {
      this._onFocusChangeWordInput();
    });
    _focusWordTranslatedInput.addListener(() {
      this._onFocusChangeWordTranslatedInput();
    });
  }

  void _onFocusChangeWordInput() {
    setState(() {
      if (_wordInputSelected == false) {
        _wordInputSelected = true;
      } else {
        _wordInputSelected = false;
      }
    });
  }

  void _onFocusChangeWordTranslatedInput() {
    setState(() {
      if (_wordTranslatedInputSelected == false) {
        _wordTranslatedInputSelected = true;
      } else {
        _wordTranslatedInputSelected = false;
      }
    });
  }

  void addItemToBox() {
    widget.callback(wordController.text, wordTranslatedController.text);
    widget.examBoxModelCallback(
        wordController.text, wordTranslatedController.text);
    FocusScope.of(context).unfocus();
    wordController.clear();
    wordTranslatedController.clear();
  }

  void translate() async {
    var translation = await translator.translate(this.wordController.text,
        from: 'en', to: 'de');
    setState(() {
      this.wordTranslatedController.text = translation.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          focusNode: _focusWordInput,
          controller: this.wordController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.arrow_forward,
              color: _wordInputSelected == true
                  ? Color(0xFFB81d4fa)
                  : Color(0xFFBafafaf),
            ),
            hintText: "Enter word",
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFB81d4fa),
              ),
            ),
          ),
        ),
        TextField(
          focusNode: _focusWordTranslatedInput,
          controller: this.wordTranslatedController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.arrow_forward,
              color: _wordTranslatedInputSelected == true
                  ? Color(0xFFB81d4fa)
                  : Color(0xFFBafafaf),
            ),
            hintText: "Translation",
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFB81d4fa),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: const Color(0xFFFFD740),
                splashColor: Colors.amberAccent,
                onPressed: this.translate,
                child: Icon(Icons.translate),
              ),
              ClipPath(
                clipper: CustomButtonClipper(),
                child: Container(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFBbdbdbd)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: this.addItemToBox,
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final r = 30.0;
    final path = Path();
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.moveTo(0, 0);
    path.lineTo(0, 45);
    path.arcToPoint(
      Offset(0, 5),
      radius: Radius.circular(r),
      clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomButtonClipper oldClipper) => false;
}
