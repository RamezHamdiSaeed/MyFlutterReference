import 'package:flutter/material.dart';
import '../utils/text.dart';
import '../utils/color.dart' as theme;

class Question extends StatelessWidget {
  final String question;

  const Question({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(question, style: TextStyle(fontSize: Size().large));
  }
}
