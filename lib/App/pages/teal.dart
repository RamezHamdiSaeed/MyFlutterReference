import "package:flutter/material.dart";

import '../components/myDrawer.dart';

class TealScreen extends StatelessWidget {
  static const String routName = '/tealScreen';

  const TealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! final is used to make nullable variable in initialization phase but once it is initialized it will not be nullable anymore
    //! to inherit the context we need to assure that it's passed within the build method
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>;

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("teal Screen"),
      ),
      body: Center(
        child: Text("teal Screen with value: ${arguments['color']}"),
      ),
    );
  }
}
