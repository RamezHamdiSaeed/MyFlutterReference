import 'package:first_flutter_app/App/pages/genders.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // void printText(msg) {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.white)),
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.teal),
          button: TextStyle(
            color: Colors.teal,
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
