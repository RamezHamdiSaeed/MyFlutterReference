import 'package:flutter/material.dart';
import 'app/screens/user_account.dart';
import './app/screens/sign_up_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

//ToDo: implement signUp screen once and if the data entered from the user ,the app will begin with home page directly not the signUp screen
var pref;
main() async {
//! if we need to make the main async it's good practice to use the below statement
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (pref.containsKey("email") && pref.containsKey("password"))
          ? const UserAccount()
          : SignUpForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}
