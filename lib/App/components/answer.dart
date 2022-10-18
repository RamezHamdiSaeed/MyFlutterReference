import 'package:flutter/material.dart';
import '../utils/color.dart' as theme;

class Answer extends StatelessWidget {
  const Answer({
    Key? key,
    required this.questionAnswer,
    required this.onPress,
    required this.customTheme,
  }) : super(key: key);

  final String questionAnswer;
  final Function()
      onPress; //! this is a function to change the local state of QuestionAndAnswer Widget state  as a trigger
  final theme.Theme customTheme;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width / 1.05, 45)),
                backgroundColor: MaterialStateProperty.all(
                    customTheme.buttonsAndAppBarBackGround)),
            onPressed: onPress,
            child: Text(
              questionAnswer,
              style: TextStyle(fontSize: 20, color: customTheme.text),
            )),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
