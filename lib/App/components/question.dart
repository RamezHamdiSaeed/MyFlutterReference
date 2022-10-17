import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  const Question(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(question, style: const TextStyle(fontSize: 20));
  }
}
