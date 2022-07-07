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
    List<Identity> identities = [
      Identity(yearOfBirth: "1998"),
      Identity(yearOfBirth: "1997"),
      Identity(yearOfBirth: "2000"),
      Identity(yearOfBirth: "2002")
    ];
    TextStyle ageTextStyle = const TextStyle(fontSize: 20);

    var modalBottomSheetContent = Container(
        //* to fetch the data from specific themeData to apply for specific item  we inherit the whore context of the Theme to specify the applied features
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: ListView.builder(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    //! I don't need to use map just we need to use spread operator (...)
                    // ...textFields,
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(
                        shadowColor: Colors.grey,
                        elevation: 2.0,
                        color: Colors.white24,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(identities[index].age,
                                    style: ageTextStyle),
                                Text(identities[index].yearOfBirth,
                                    style: ageTextStyle)
                              ]),
                        ),
                      ),
                    ),
                  ]);
                }

                //! we used stack here to make a postfix text indirectly using Stack widget just for practising only

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
                // ElevatedButton(
                //   child: const Text("submit"),
                //   onPressed: () {
                //     setState(() {
                //       Identity i = Identity(yearOfBirth: ageController.text);
                //       i.age;
                //       age = i.age.toString();
                //     });
                //   },
                // ),
                // const SizedBox(height: 90),
                )));
    return Container(
      //* if the widget has no padding or margin feature we can wrap it within padding or margin Widgets
      //* and we use use them instead of width and heigh if not existed
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      height: double.infinity,
      alignment: Alignment.center,
      child: ElevatedButton(
        child: const Text("show Bottom Sheet"),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return modalBottomSheetContent;
              });
        },
      ),
    );
  }
}
