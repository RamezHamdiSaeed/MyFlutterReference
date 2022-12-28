import 'package:flutter/material.dart';

class CategoryElement extends StatelessWidget {
  final Color color;
  final String title;
  const CategoryElement({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(
            colors: [color, color.withOpacity(0.1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Text(title),
    );
  }
}
