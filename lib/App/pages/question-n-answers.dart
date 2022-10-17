import 'package:flutter/material.dart';
import '../components/question.dart';

class QuestionAndAnswer extends StatefulWidget {
  const QuestionAndAnswer({Key? key}) : super(key: key);

  @override
  State<QuestionAndAnswer> createState() => _QuestionAndAnswerState();
}

class _QuestionAndAnswerState extends State<QuestionAndAnswer> {
  final List<String> questions = ["First Question?"];
  int questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz App")),
      // ignore: prefer_const_constructors
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
            width: double.infinity,
            child: Column(children: [Question(questions[questionIndex])])),
      ),
    );
  }
}
