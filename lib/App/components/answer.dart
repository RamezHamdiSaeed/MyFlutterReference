import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    Key? key,
    required this.questionAnswer,
  }) : super(key: key);

  final String questionAnswer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor)),
        onPressed: null,
        child: Text(
          questionAnswer,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ));
  }
}
