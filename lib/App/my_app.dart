import 'package:first_flutter_app/App/pages/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/counter.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // void printText(msg) {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // we use routes with specified initialRoute to use navigator .pushNamed and organize Navigation Map for Readability
      //! when we are using routes and initialRoute we have to remove home property from MaterialApp
      //* it's better to use route name from the widget representing the page to avoid confusion and long routes
//! we need to surround the parent widget with ChangeNotifierProvider to use the model in the provider
//! don't forget to specify the create method in the provider to create the model
//* now we don't need to use the model inside the DashBoardScreen anymore.
      home: ChangeNotifierProvider<Counter>(
          create: (_) => Counter(), child: const DashBoardScreen()),
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
