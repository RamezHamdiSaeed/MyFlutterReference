import 'package:flutter/material.dart';
// import 'package:my_flutter_reference/app/screens/home_page.dart';

main() {
  runApp(const BMI());
}

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool lightTheme = (ThemeMode.system == ThemeMode.light) ? true : false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //! theme mode can be dark or light or based on the platform theme in modern devices
      themeMode: lightTheme ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
          primaryColor: Colors.amber[50],
          canvasColor: Colors.amber[200],
          textTheme:
              const TextTheme(headline5: TextStyle(color: Colors.white))),
      darkTheme: ThemeData(
        primaryColor: Colors.amber[300],
        canvasColor: Colors.amber[400],
        textTheme: const TextTheme(
          headline5: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title:
              Text('ThemeSwitch', style: Theme.of(context).textTheme.headline5),
          actions: [
            Switch(
                value: lightTheme,
                onChanged: (val) {
                  setState(() {
                    lightTheme = val;
                  });
                })
          ],
        ),
      ),
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
