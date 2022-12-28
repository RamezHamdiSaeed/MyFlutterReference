import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          title: const Text(
            "Meals Categories",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
