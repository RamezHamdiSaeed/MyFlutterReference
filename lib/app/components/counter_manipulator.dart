import 'package:flutter/material.dart';

//! we used this component as a widget not like the other components since it has own state (counter) and we want to change it locally using setState without changing the state of the screen as a whole
class CounterManipulator extends StatefulWidget {
  final String text;
  final String measureUnit;
  final int counterDefaultValue;
  const CounterManipulator(
      {Key? key,
      required this.text,
      required this.counterDefaultValue,
      required this.measureUnit})
      : super(key: key);

  @override
  State<CounterManipulator> createState() => _CounterManipulatorState();
}

class _CounterManipulatorState extends State<CounterManipulator> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    counter = widget.counterDefaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.black26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.text,
            style: Theme.of(context).textTheme.headline2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$counter", style: Theme.of(context).textTheme.headline1),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.measureUnit,
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(
                    () {
                      counter++;
                    },
                  );
                },
                mini: true,
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  setState(
                    () {
                      counter--;
                    },
                  );
                },
                mini: true,
                child: const Icon(Icons.remove),
              )
            ],
          )
        ],
      ),
    ));
  }
}
