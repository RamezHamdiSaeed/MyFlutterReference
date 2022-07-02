import 'package:flutter/material.dart';
import 'package:first_flutter_app/App/models/age.dart';

class TextFields extends StatefulWidget {
  const TextFields({Key? key}) : super(key: key);

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  bool passwordVisibility = false;
  TextEditingController controller = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String age = '0';
  Container textFieldTemplate(
      {bool isReadOnly = false,
      bool obsecureText = false,
      TextInputType keyboardType = TextInputType.text,
      Widget? icon,
      Widget? suffixIcon,
      required String decorationLabelText}) {
    obsecureText = (keyboardType == TextInputType.visiblePassword)
        ? !passwordVisibility
        : obsecureText;

    InputDecoration inputDecorationTemplate = InputDecoration(
      icon: icon,
      suffixIcon: suffixIcon,
      fillColor: Colors.white,
      filled: true,
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 10),
          borderRadius: BorderRadius.all(Radius.circular(80))),
      label: (decorationLabelText == "Age")
          ? Text(age)
          : Text("Enter your $decorationLabelText"),
      hintText: (decorationLabelText == "Age")
          ? age
          : "Enter your $decorationLabelText",
      hintStyle:
          const TextStyle(color: Color.fromARGB(60, 65, 65, 65), height: 3.0),
    );

    return Container(
      height: 40,
      margin: const EdgeInsets.all(20),
      child: TextField(
        readOnly: isReadOnly,
        obscureText: obsecureText,
        keyboardType: keyboardType,
        decoration: inputDecorationTemplate,
        controller: (decorationLabelText == "year of birth")
            ? ageController
            : controller,
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
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.calendar_today),
                decorationLabelText: "year of birth"),
            textFieldTemplate(
                isReadOnly: true,
                obsecureText: false,
                keyboardType: TextInputType.number,
                icon: const Icon(Icons.date_range),
                decorationLabelText: "Age"),
            // textFieldTemplate(
            //     keyboardType: TextInputType.visiblePassword,
            //     icon: const Icon(Icons.lock),
            //     suffixIcon: IconButton(
            //         onPressed: () {
            //           setState(() {
            //             passwordVisibility = !passwordVisibility;
            //           });
            //         },
            //         icon: (passwordVisibility)
            //             ? const Icon(Icons.visibility)
            //             : const Icon(Icons.visibility_off)),
            //     decorationLabelText: "Password"),
            // textFieldTemplate(
            //     obsecureText: false,
            //     keyboardType: TextInputType.text,
            //     icon: const Icon(Icons.male),
            //     decorationLabelText: "Gender"),
            ElevatedButton(
              child: const Text("submit"),
              onPressed: () {
                setState(() {
                  Identity i = Identity(yearOfBirth: ageController.text);
                  i.calculateAge();
                  age = i.age.toString();
                });
              },
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
