import 'package:first_flutter_app/App/components/container_card.dart';
import 'package:first_flutter_app/App/models/counter.dart';
import 'package:flutter/material.dart';
// import 'package:first_flutter_app/App/models/counter.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            height: 200,
            child: Card(
              elevation: 10,
              child: CounterCard(),
            ),
          )
        ],
      ),
    );
  }
}
