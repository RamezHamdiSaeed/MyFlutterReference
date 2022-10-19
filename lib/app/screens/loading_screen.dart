import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/api_handler.dart' as apihandler;

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Connection Text")),
      body: Center(
        child: StreamBuilder(
            stream:
                Stream.periodic(const Duration(seconds: 1), (val) => val + 1),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                final data = snapshot.data as int;
                return Text("seconds:$data");
              } else {
                return const Text("Something Went Wrong, try again later");
              }
            }),
      ),
    );
  }
}
