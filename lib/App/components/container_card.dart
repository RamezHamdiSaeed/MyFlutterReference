import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_flutter_app/App/models/counter.dart';

class CounterCard extends StatefulWidget {
  const CounterCard({Key? key}) : super(key: key);

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  //! and now we can access the provider directly from the widget to update this specific widget
  //! using the Provider.of<{ProviderModel}>(context).{changing variable using the methods with notifyListeners(),or using them directly}
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Counter: ${Provider.of<Counter>(context).count}"),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<Counter>(context, listen: false).increment();
                    },
                    child: const Text("Increment")),
              ],
            )));
  }
}
