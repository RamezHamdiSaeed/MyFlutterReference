import 'package:flutter/material.dart';
import 'package:my_flutter_reference/app/screens/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  int age = 30;
  int weightInKG = 60;
  double heightInM = 1.6;
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
              counterManipulator(
                "Weight",
                "KG",
                weightInKG,
              ),
              const SizedBox(
                width: 5,
              ),
              counterManipulator(
                "Age",
                "Y",
                age,
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                            isMale: isMale,
                            age: age,
                            heightInM: heightInM,
                            weightInKG: weightInKG))),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 30,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ))),
    );
  }

  Expanded counterManipulator(
      String text, String measureUnit, int counterDefaultValue) {
    return Expanded(
        child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.black26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((text == "Weight") ? "$weightInKG" : "$age",
                    style: Theme.of(context).textTheme.headline1),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  measureUnit,
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(
                    () {
                      (text == "Weight") ? weightInKG++ : age++;
                    },
                  );
                },
                mini: true,
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  setState(
                    () {
                      (text == "Weight") ? weightInKG-- : age--;
                    },
                  );
                },
                mini: true,
                child: const Icon(Icons.remove),
              )
            ],
          )
        ],
      ),
    ));
  }

  Expanded rowOfInputs(List<Widget> inputFields) {
    return Expanded(
      flex: 4,
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
