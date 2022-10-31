import 'package:flutter/material.dart';
import 'package:my_flutter_reference/app/screens/main_splash_screen.dart';

main() {
  runApp(const BMI());
}

class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainSplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
