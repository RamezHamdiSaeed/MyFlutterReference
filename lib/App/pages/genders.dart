import 'package:first_flutter_app/App/components/changing_fab_tooltip.dart';
import 'package:flutter/material.dart';

class Genders extends StatelessWidget {
  const Genders({Key? key}) : super(key: key);

  TextStyle textButtonStyle({required Color color}) {
    return TextStyle(color: color, shadows: <Shadow>[
      Shadow(
        color: color,
        offset: const Offset(5, 5),
        blurRadius: 10,
      )
    ]);
  }

  Container textFieldTemplate(
      {bool obsecureText = false,
      TextInputType keyboardType = TextInputType.text,
      required Icon icon,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add_alert),
        title: const Text('Gender'),
        // actions: const <Widget>[
        //   Icon(Icons.add),
        // ],
      ),
      floatingActionButton: const ChangingFloatingActionButtonTooltip(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Container(
        // padding: const EdgeInsets.only(top: 200),
        alignment: Alignment.center,
        color: Colors.white,
        // color: const Color(0x51ff0000),
        // color: const Color.fromARGB(250, 255, 0, 255),
        // color: const Color.fromRGBO(255, 0, 0, 0.2),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              textFieldTemplate(
                  obsecureText: false,
                  keyboardType: TextInputType.text,
                  icon: const Icon(Icons.person),
                  decorationLabelText: "First Name"),
              textFieldTemplate(
                  obsecureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  icon: const Icon(Icons.lock),
                  decorationLabelText: "Password"),
              textFieldTemplate(
                  obsecureText: false,
                  keyboardType: TextInputType.text,
                  icon: const Icon(Icons.male),
                  decorationLabelText: "Gender"),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
