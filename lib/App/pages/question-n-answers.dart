import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../components/question.dart';
import '../components/answer.dart';

class QuestionAndAnswer extends StatefulWidget {
  const QuestionAndAnswer({Key? key}) : super(key: key);

  @override
  State<QuestionAndAnswer> createState() => _QuestionAndAnswerState();
}

class _QuestionAndAnswerState extends State<QuestionAndAnswer> {
  final List<Map<String, dynamic>> questionAndAnswers = [
    {
      "question": "First Question?",
      "answers": [
        "first question first answer",
        "first question second answer",
        "first question third answer",
        "first question fourth answer"
      ]
    },
    {
      "question": "Second Question?",
      "answers": [
        "second question first answer",
        "second question second answer",
        "second question third answer",
        "second question fourth answer"
      ]
    }
  ];

  int questionIndex = 0;
  void answerOnPress() {
    if (kDebugMode) {
      print("answer selected");
    }
    setState(() {
      (questionAndAnswers.length - 1 == questionIndex)
          ? (questionIndex = 0)
          : questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz App")),
      // ignore: prefer_const_constructors
      body: SizedBox(
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Question(questionAndAnswers[questionIndex]["question"]),
            const SizedBox(height: 20),
            ...questionAndAnswers[questionIndex]["answers"].map((answer) =>
                Answer(questionAnswer: answer, onPress: answerOnPress)),
          ])),
    );
  }
}
