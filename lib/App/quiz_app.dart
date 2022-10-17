import './pages/question-n-answers.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // void printText(msg) {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // we use routes with specified initialRoute to use navigator .pushNamed and organize Navigation Map for Readability
      //! when we are using routes and initialRoute we have to remove home property from MaterialApp
      //* it's better to use route name from the widget representing the page to avoid confusion and long routes
      home: const QuestionAndAnswer(),
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.white)),
        ),
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            titleTextStyle: TextStyle(fontFamily: "Splash", fontSize: 20)),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.teal, fontFamily: "Splash"),
          button: TextStyle(
            color: Colors.teal,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 1,
          ),
        ), //! to use accentColor you need to use colorSchema as its alternative and also for primarySwatch
        primarySwatch: Colors.teal,
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
        //     .copyWith(secondary: Colors.blueAccent),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
