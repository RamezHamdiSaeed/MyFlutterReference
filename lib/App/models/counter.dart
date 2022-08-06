import 'package:flutter/material.dart';

//! to use the model in provider we will add features to it
//! add the model to the provider using  a mixin call ChangeNotifier.
//! and make sure that to use the notifyListeners() method in the model (to the methods which change the state of the model (variables )
class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}
