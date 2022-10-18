import 'package:flutter/material.dart';

class Theme {
  Color buttonsAndAppBarBackGround = Colors.tealAccent;

  Color text = Colors.black;

  whiteTheme() {
    buttonsAndAppBarBackGround = Colors.tealAccent;
    text = Colors.black;
  }

  blackTheme() {
    buttonsAndAppBarBackGround = const Color.fromARGB(255, 1, 77, 69);
    text = Colors.white;
  }
}
