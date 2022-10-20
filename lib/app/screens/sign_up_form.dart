import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_account.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Enter Email", suffixText: "@gmail.com"),
              controller: email,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter password"),
              obscureText: true,
              controller: password,
            ),
            //! it's recommended to use builder if the widget is innermost the parent widget (class)
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () async {
                    final pref = await SharedPreferences.getInstance();
                    pref.setString("email", email.text);
                    pref.setString("password", password.text);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserAccount()));
                  },
                  child: const Text("SignUp"));
            })
          ],
        ),
      ),
    );
  }
}
