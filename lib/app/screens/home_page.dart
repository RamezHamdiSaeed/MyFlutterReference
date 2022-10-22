import 'package:flutter/material.dart';
import 'package:my_flutter_reference/app/components/counter_manipulator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Expanded(
              child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            rowOfInputs([
              iconTextButton("Male", isMale),
              const SizedBox(
                width: 5,
              ),
              iconTextButton("Female", !isMale)
            ]),
            rowOfInputs([]),
            rowOfInputs([
              const CounterManipulator(
                text: "Weight",
                counterDefaultValue: 50,
                measureUnit: "KG",
              ),
              const SizedBox(
                width: 5,
              ),
              const CounterManipulator(
                text: "Age",
                counterDefaultValue: 30,
                measureUnit: "Y",
              )
            ])
          ],
        ),
      ))),
    );
  }

  Expanded rowOfInputs(List<Widget> inputFields) {
    return Expanded(
      child: Row(
        children: inputFields,
      ),
    );
  }

  Expanded iconTextButton(String text, bool isPressed) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() {
          isMale = (text == "Male") ? true : false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: isPressed
                ? (isMale
                    ? const Color.fromARGB(255, 38, 76, 143)
                    : const Color.fromARGB(255, 153, 37, 76))
                : Colors.black26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              text == "Male" ? Icons.male : Icons.female,
              size: 50,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.headline2,
            )
          ],
        ),
      ),
    ));
  }
}
