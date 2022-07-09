import "package:flutter/material.dart";

class RedScreen extends StatelessWidget {
  static const String routName = '/redScreen';

  const RedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("red Screen"),
      ),
      body: Center(
        child: Text("red Screen with value: ${arguments['color']}"),
      ),
    );
  }
}
