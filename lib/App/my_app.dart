import 'package:first_flutter_app/App/pages/genders.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // void printText(msg) {
  //   // ignore: avoid_print
  //   print("button clicked with '$msg'");
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.white)),
        ),
        textTheme: const TextTheme(
          button: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 1,
          ),
        ),
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: const Genders(),
    );
  }
}
