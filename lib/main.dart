import 'package:flutter/material.dart';
import 'package:my_flutter_reference/app/screens/home_page.dart';

//ToDo: develop BMI App
//! beginning with result screen just for now
main() {
  runApp(const BMI());
}

class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          canvasColor: const Color.fromARGB(255, 83, 83, 83),
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))),
      home: HomePage(),
      //const Result(
      //   age: 25,
      //   heightInM: 1.7,
      //   isMale: true,
      //   weightInKG: 60,
      // ),
      debugShowCheckedModeBanner: false,
    );
  }
}
