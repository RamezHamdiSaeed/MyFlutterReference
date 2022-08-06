import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({Key? key, required this.counterInit}) : super(key: key);
  final int counterInit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Card(
            elevation: 10, child: Center(child: Text(counterInit.toString()))),
      ),
    );
  }
}
