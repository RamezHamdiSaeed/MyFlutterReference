import 'dart:math';

import "package:flutter/material.dart";

import '../components/myDrawer.dart';

class RedScreen extends StatefulWidget {
  static const String routName = '/redScreen';

  const RedScreen({Key? key}) : super(key: key);

  @override
  State<RedScreen> createState() => _RedScreenState();
}

class _RedScreenState extends State<RedScreen> {
  double sliderValue = 0.0;
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
          children: [
            Transform.rotate(
              angle: pi / 4 * sliderValue,
              child: Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 50),
                color: Colors.red,
                width: sliderValue,
                height: sliderValue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text("red Screen with value: ${arguments['color']}"),
                    Slider(
                      value: sliderValue,
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                      min: 0.0,
                      max: 100.0,
                      divisions: 200,
                      label: "square size",
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop("red");
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_outlined),
                        label: const Text("Back")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
