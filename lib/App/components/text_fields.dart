import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({Key? key}) : super(key: key);

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  bool passwordVisibility = false;

  Container textFieldTemplate(
      {bool obsecureText = false,
      TextInputType keyboardType = TextInputType.text,
      Widget? icon,
      Widget? suffixIcon,
      required String decorationLabelText}) {
    obsecureText = (keyboardType == TextInputType.visiblePassword)
        ? !passwordVisibility
        : obsecureText;

    InputDecoration inputDecorationTemplate = InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 10),
            borderRadius: BorderRadius.all(Radius.circular(80))),
        label: Text(decorationLabelText),
        hintText: "Enter your $decorationLabelText",
        hintStyle: const TextStyle(
            color: Color.fromARGB(60, 65, 65, 65), height: 3.0));

    InputDecoration inputDecoration = (icon == null)
        ? inputDecorationTemplate
        : inputDecorationTemplate.copyWith(icon: icon);

    inputDecoration = (suffixIcon == null)
        ? inputDecoration
        : inputDecoration.copyWith(suffixIcon: suffixIcon);
    return Container(
      height: 40,
      margin: const EdgeInsets.all(20),
      child: TextField(
        obscureText: obsecureText,
        keyboardType: keyboardType,
        decoration: inputDecoration,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            textFieldTemplate(
                obsecureText: false,
                keyboardType: TextInputType.emailAddress,
                icon: const Icon(Icons.email),
                decorationLabelText: "Email"),
            textFieldTemplate(
                keyboardType: TextInputType.visiblePassword,
                icon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisibility = !passwordVisibility;
                      });
                    },
                    icon: (passwordVisibility)
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)),
                decorationLabelText: "Password"),
            textFieldTemplate(
                obsecureText: false,
                keyboardType: TextInputType.text,
                icon: const Icon(Icons.male),
                decorationLabelText: "Gender"),
            ElevatedButton(
              child: const Text("submit"),
              onPressed: () {},
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
