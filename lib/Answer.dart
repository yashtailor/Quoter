import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  String answerText;
  final Function selectHandler;

  Answer(this.answerText,this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        child: Text(answerText),
        onPressed: selectHandler,
        color: Colors.lightBlueAccent,
        textColor: Colors.white,
      ),
    );
  }
}
