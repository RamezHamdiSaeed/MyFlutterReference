import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:my_flutter_reference/app/screens/auth_screen.dart';

class MainSplashScreen extends StatelessWidget {
  const MainSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //! the splash screen is usually used to give a brief info about the company provider to the user with logo and title
        //* don't forget to pass argument to the navigator to navigate to the main screen of the app
        body: EasySplashScreen(
      logo: Image.asset("assets/images/icon/icon.jpeg"),
      title: const Text("Welcome back"),
      navigator: const AuthScreen(),
    ));
  }
}
