import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final bool isMale;
  final int age;
  final double heightInM;
  final int weightInKG;

  const Result({
    Key? key,
    required this.isMale,
    required this.age,
    required this.heightInM,
    required this.weightInKG,
  }) : super(key: key);
  double get bMI {
    return weightInKG / (heightInM * heightInM);
  }

  String get bMIMessage {
    String message = '';
    if (bMI >= 40)
      message = "Obese";
    else if (bMI >= 25)
      message = "Fat";
    else if (bMI >= 18.5)
      message = "Normal";
    else
      message = "thin";
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Result"),
        centerTitle: true,
      ),
      //! we use the SafeArea to avoid the problems of notched screens
      //! since the BMI is recommended to be double rounded by 2 digits
      //* we changed the predefined styles in textTheme within the ThemeData to apply the changes for all the projects texts if we want
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.headline1!,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Gender : ${isMale ? "Male" : "Female"}"),
                  Text("Age : $age years"),
                  Text("weight : $weightInKG KG"),
                  Text("Height : $heightInM m"),
                  Text("BMI Number:${bMI.toStringAsFixed(2)}"),
                  Text("BMI : $bMIMessage"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
