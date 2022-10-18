import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({Key? key, required this.questionAnswer, required this.onPress})
      : super(key: key);

  final String questionAnswer;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width / 1.05, 45)),
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor)),
            onPressed: onPress,
            child: Text(
              questionAnswer,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            )),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
