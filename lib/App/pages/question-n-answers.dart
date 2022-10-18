import 'package:flutter/material.dart';
import '../components/question.dart';
import '../components/answer.dart';

class QuestionAndAnswer extends StatefulWidget {
  const QuestionAndAnswer({Key? key}) : super(key: key);

  @override
  State<QuestionAndAnswer> createState() => _QuestionAndAnswerState();
}

class _QuestionAndAnswerState extends State<QuestionAndAnswer> {
  final List<String> questions = ["First Question?", "second Question?"];
  final List<List<String>> questionAnswers = [
    [
      "first question first answer",
      "first question second answer",
      "first question third answer",
      "first question fourth answer"
    ]
  ];
  int questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz App")),
      // ignore: prefer_const_constructors
      body: SizedBox(
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Question(questions[questionIndex]),
            const SizedBox(height: 20),
            Answer(questionAnswer: questionAnswers[questionIndex][0]),
          ])),
    );
  }
}
