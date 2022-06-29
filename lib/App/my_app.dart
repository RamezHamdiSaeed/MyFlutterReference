import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add_alert),
        title: const Text('first app from scratch '),
        // actions: const <Widget>[
        //   Icon(Icons.add),
        // ],
      ),
      body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[Text('Hello World')],
          )),
    ));
  }
}
