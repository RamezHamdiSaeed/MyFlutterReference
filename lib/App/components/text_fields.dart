import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({Key? key}) : super(key: key);

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  Container textFieldTemplate(
      {bool obsecureText = false,
      TextInputType keyboardType = TextInputType.text,
      required Widget icon,
      required String decorationLabelText}) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextField(
        obscureText: obsecureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            icon: icon,
            label: Text(decorationLabelText),
            hintText: "Enter your $decorationLabelText",
            hintStyle: const TextStyle(color: Color.fromARGB(60, 65, 65, 65))),
      ),
    );
  }

  bool passwordVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        textFieldTemplate(
            obsecureText: false,
            keyboardType: TextInputType.emailAddress,
            icon: const Icon(Icons.email),
            decorationLabelText: "Email"),
        Container(
          margin: const EdgeInsets.all(20),
          child: TextField(
            obscureText: !passwordVisibility,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                icon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisibility
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility;
                    });
                  },
                ),
                label: const Text("Password"),
                hintText: "Enter your password",
                hintStyle:
                    const TextStyle(color: Color.fromARGB(60, 65, 65, 65))),
          ),
        ),
        textFieldTemplate(
            obsecureText: false,
            keyboardType: TextInputType.text,
            icon: const Icon(Icons.male),
            decorationLabelText: "Gender"),
        const SizedBox(height: 90),
      ],
    );
  }
}
