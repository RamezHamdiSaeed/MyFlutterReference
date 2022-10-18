import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../components/question.dart';
import '../components/answer.dart';
import '../utils/text.dart';
import '../utils/color.dart' as theme;

class QuestionAndAnswers extends StatefulWidget {
  const QuestionAndAnswers({Key? key}) : super(key: key);

  @override
  State<QuestionAndAnswers> createState() => _QuestionAndAnswersState();
}

class _QuestionAndAnswersState extends State<QuestionAndAnswers> {
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

  final customTheme = theme.Theme();
  bool isSwitch = false;

  void answerOnPress() {
    if (kDebugMode) {
      print("answer selected $questionIndex");
    }
    setState(() {
      questionIndex = (questionIndex == questionAndAnswers.length - 1)
          ? -1 //! just to break the cycle to the result screen then get back  with value 0
          : questionIndex + 1;
    });
  }

  Column body(body) =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: body);
  @override
  Widget build(BuildContext context) {
    List<Widget> result = [
      Text(
        "Done",
        style: TextStyle(fontSize: Size().large),
      ),
      TextButton(
          onPressed: () {
            setState(() {
              questionIndex = 0;
            });
          },
          child: const Text(
            "Retake The Quiz?!!",
            style: TextStyle(color: Colors.red),
          ))
    ];

    List<Widget> quizBody = (questionIndex == -1)
        ? [body(result)]
        : [
            Question(question: questionAndAnswers[questionIndex]["question"]),
            const SizedBox(height: 20),
            ...questionAndAnswers[questionIndex]["answers"].map((answer) =>
                Answer(
                    questionAnswer: answer,
                    onPress: answerOnPress,
                    customTheme: customTheme)),
          ];

    return Scaffold(
      appBar: AppBar(
          title: Text("Quiz App", style: TextStyle(color: customTheme.text)),
          actions: [
            Center(
                child:
                    Text("Theme", style: TextStyle(color: customTheme.text))),
            Switch(
              value: isSwitch,
              onChanged: (value) {
                setState(() {
                  isSwitch = value;
                  (value) ? customTheme.blackTheme() : customTheme.whiteTheme();
                });
              },
              activeColor: customTheme.text,
            )
          ],
          backgroundColor: customTheme.buttonsAndAppBarBackGround),
      body: SizedBox(width: double.infinity, child: body(quizBody)),
    );
  }
}
