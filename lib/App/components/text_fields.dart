import 'package:flutter/material.dart';

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
    // List<Container> textFields = [
    //   textFieldTemplate(
    //       obsecureText: false,
    //       keyboardType: TextInputType.number,
    //       icon: const Icon(Icons.calendar_today),
    //       decorationLabelText: "year of birth"),
    //   textFieldTemplate(
    //       isReadOnly: true,
    //       obsecureText: false,
    //       keyboardType: TextInputType.number,
    //       icon: const Icon(Icons.date_range),
    //       decorationLabelText: "Age")
    // ];

    return Container(
      //* if the widget has no padding or margin feature we can wrap it within padding or margin Widgets
      //* and we use use them instead of width and heigh if not existed
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      height: double.infinity,
      alignment: Alignment.center,
      child: ElevatedButton(
          child: const Text("show Bottom Sheet"), onPressed: () {}),
    );
  }
}
