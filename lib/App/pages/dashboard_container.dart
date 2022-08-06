import 'package:first_flutter_app/App/components/container_card.dart';
import 'package:first_flutter_app/App/models/counter.dart';
import 'package:flutter/material.dart';
// import 'package:first_flutter_app/App/models/counter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Counter counter = Counter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Card(
                  elevation: 10,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CounterCard(counterInit: counter.count),
                      const SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              counter.increment();
                            });
                          },
                          child: const Text("Increment")),
                    ],
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
