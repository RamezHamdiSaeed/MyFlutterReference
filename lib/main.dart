import 'package:flutter/material.dart';
// import 'package:my_flutter_reference/app/screens/main_splash_screen.dart';
import 'package:my_flutter_reference/app/screens/page_view.dart';
import 'package:my_flutter_reference/app/screens/auth_screen.dart';
import 'package:my_flutter_reference/app/screens/main_splash_screen.dart';

main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(size: 100),
        textTheme: const TextTheme(
          headline3: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          headline6: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
        ),
      ),
      routes: {
        "/": (context) => const PageViewScreen(),
        "/splashScreen": (context) => const MainSplashScreen(),
        "/authScreen": (context) => const AuthScreen(),
      },
      initialRoute: "/",
    );
  }
}

// class BMI extends StatelessWidget {
//   const BMI({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: PageViewScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
