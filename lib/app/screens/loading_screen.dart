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
        child: FutureBuilder(
            future: apihandler.fetchDataFromAPI(
                "https://jsonplaceholder.typicode.com/photos"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                final data = snapshot.data as List;
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (_, index) => Text(data[index]["title"]));
              } else {
                if (kDebugMode) {
                  print(snapshot.error);
                }
                return const Text("Something Went Wrong, try again later");
              }
            }),
      ),
    );
  }
}
