import 'package:flutter/material.dart';

class ChangingFloatingActionButtonTooltip extends StatefulWidget {
  const ChangingFloatingActionButtonTooltip({Key? key}) : super(key: key);

  @override
  State<ChangingFloatingActionButtonTooltip> createState() =>
      _ChangingFloatingActionButtonTooltipState();
}

class _ChangingFloatingActionButtonTooltipState
    extends State<ChangingFloatingActionButtonTooltip> {
  int tooltipIndex = 0;
  List<String> tooltips = [
    'Add',
    'Edit',
    'Delete',
    'Save',
    'Cancel',
    'Search',
    'Filter',
    'Settings',
    'Help',
    'About',
  ];
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        setState(() {
          tooltipIndex = (tooltipIndex + 1) % tooltips.length;
        });
      },
      icon: const Icon(Icons.question_mark),
      label: const Text("info"),
      tooltip: tooltips[tooltipIndex],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
