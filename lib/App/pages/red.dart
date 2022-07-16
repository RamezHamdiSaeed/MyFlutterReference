import "package:flutter/material.dart";

import '../components/myDrawer.dart';

class RedScreen extends StatelessWidget {
  static const String routName = '/redScreen';

  const RedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>;

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("red Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("red Screen with value: ${arguments['color']}"),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop("red");
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
                label: const Text("Back")),
          ],
        ),
      ),
    );
  }
}
