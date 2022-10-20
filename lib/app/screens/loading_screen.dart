import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String url = "https://www.youtube.com/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Connection Text")),
      body: Center(
          child: ElevatedButton(
        //! i want to lunch url from the app when the below button is pressed and if there is a preinstalled mobile app it will be opened in the mobile app
        onPressed: () async {
          if (!await launchUrl(Uri.parse(url),
              mode: LaunchMode.externalApplication)) {
            throw 'Could not launch $url';
          }
          setState(() {
            url = "couldn't launch";
          });
        },
        child: Text("url:$url"),
      )),
    );
  }
}
