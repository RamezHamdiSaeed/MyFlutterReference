import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_reference/app/screens/main_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum AuthMode { signIn, signUp }

class _AuthScreenState extends State<AuthScreen> {
  //! there are two types of registration and will effect the ui screen adding one more textFormField for password validator
  AuthMode authMode = AuthMode.signIn;
  //* we will save the data in map
  Map<String, String> user = {"Email": "", "Password": ""};
  //! we need a global key to the form (which all the form fields are within it) to trigger the onSave and the validate
  final GlobalKey<FormState> _formGlobalKey = GlobalKey();
  //* we need controller for each input field that under monitoring
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
            key: _formGlobalKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextFormField(
                //* we need to put label
                decoration: const InputDecoration(
                    label: Text("Email", style: TextStyle(fontSize: 15)),
                    hintText: "@xyz.com"),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text!.isEmpty || !(text.contains("@"))) {
                    return "You didn't enter a valid E-mail Address";
                  }
                  return null;
                },
                onSaved: (text) {
                  user["Email"] = text ?? "";
                },
              ), //* for email
              TextFormField(
                //* we need to put label
                decoration: const InputDecoration(
                  label: Text("Password", style: TextStyle(fontSize: 15)),
                ),
                obscureText: true,
                validator: (text) {
                  if (text!.length < 8) {
                    return "You didn't enter a valid E-mail Password";
                  }
                  return null;
                },
                onSaved: (text) {
                  user["Password"] = text ?? "";
                },
              ) //* for password
              ,
              if (authMode == AuthMode.signUp)
                TextFormField(
                  //* we need to put label
                  decoration: const InputDecoration(
                    label: Text("Confirm Password",
                        style: TextStyle(fontSize: 15)),
                  ),
                  obscureText: true,
                  validator: (text) {
                    if (text != _password.text) {
                      return "You didn't enter a valid E-mail Address";
                    }
                    return null;
                  },
                ) // * for password confirm
              ,
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () async {
                    //! validate call the validator of each form input fields within it ,since if any validator returned A String it will printed under its field with red color
                    if (_formGlobalKey.currentState!.validate()) {
                      _formGlobalKey.currentState!.save();
                      Future.delayed(
                          const Duration(seconds: 3),
                          () => Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MainScreen())));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Welcome")),
                      );
                    }
                  }, //! trigger the validators of the input types (TextFormFields)
                  child: Text((authMode == AuthMode.signIn)
                      ? "Sign In"
                      : "Sign Up")), //* to validate and submit the values entered to input fields
              OutlinedButton(
                  style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () {
                    authModeSwitch;
                  }, //! toggle the AuthMode switch
                  child: Text(
                      "Switch to ${(authMode == AuthMode.signUp) ? "Sign In" : "Sign Up"}"))
            ])),
      )),
    );
  }

  get authModeSwitch {
    if (authMode == AuthMode.signIn) {
      setState(() {
        authMode = AuthMode.signUp;
      });
    } else {
      setState(() {
        authMode = AuthMode.signIn;
      });
    }
  }
}
