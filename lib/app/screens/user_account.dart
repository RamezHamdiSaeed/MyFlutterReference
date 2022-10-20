import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  String? email;
  String? password;
  void getPersistentNotCriticalData() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      email = pref.getString("email");
      password = pref.getString("password");
    });
  }

  @override
  void initState() {
    super.initState();
    getPersistentNotCriticalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("User Account Details")),
        body: Center(
            //! the DefaultTextStyle is used to change the TextStyle of the context within its child Widget only
            child: DefaultTextStyle(
          style: const TextStyle(color: Colors.red),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "welcome Back : you entered with email: ${email ?? "Why didn't you enter your name?"}",
                textAlign: TextAlign.center,
              )
            ],
          ),
        )));
  }
}
