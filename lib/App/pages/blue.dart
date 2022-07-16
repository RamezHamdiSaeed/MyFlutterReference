import "package:flutter/material.dart";

import '../components/myDrawer.dart';

class BlueScreen extends StatelessWidget {
  static const String routName = '/blueScreen';
  const BlueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>;

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Blue Screen"),
      ),
      body: Center(
        child: Text("Blue Screen with value: ${arguments['color']}"),
      ),
    );
  }
}
