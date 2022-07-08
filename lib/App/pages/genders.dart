// import 'package:first_flutter_app/App/components/changing_fab_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:first_flutter_app/App/models/age.dart';

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

  @override
  Widget build(BuildContext context) {
    List<Identity> identities = [
      Identity(yearOfBirth: "1998"),
      Identity(yearOfBirth: "1997"),
      Identity(yearOfBirth: "2000"),
      Identity(yearOfBirth: "2002")
    ];
    TextStyle ageTextStyle = const TextStyle(fontSize: 20);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add_alert),
        title: const Text('Age Calculator'),
        // actions: const <Widget>[
        //   Icon(Icons.add),
        // ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: null,
      bottomNavigationBar: BottomBarWithSheet(
        mainActionButtonTheme: const MainActionButtonTheme(color: Colors.teal),
        bottomBarTheme: const BottomBarTheme(
          mainButtonPosition: MainButtonPosition.middle,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          itemIconColor: Colors.teal,
          itemTextStyle: TextStyle(
            color: Colors.teal,
            fontSize: 10.0,
          ),
          selectedItemTextStyle: TextStyle(
            color: Colors.teal,
            fontSize: 10.0,
          ),
        ),
        //* the below statement is used for items with main action button
        // onSelectItem: (index) => debugPrint('$index'),
        sheetChild: Center(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                    ))),
        items: const [],
      ),
    );
  }
}
