import 'package:first_flutter_app/App/components/dashboard_container.dart';
import 'package:flutter/material.dart';

import '../models/counter.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("counter")),
      body: Dashboard(
        counter: counter,
      ),
    );
  }
}
