import 'dart:io';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> programmingLanguages = [
    "Dart",
    "JavaScript",
    "TypeScript",
    "Java",
    "Python",
    "C"
  ];
  double percent = 0.5;
  Gender? genderIndicator = Gender.male;
//* adding leading Icon
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black,
                      Colors.white,
                      Colors.black
                    ])),
                  ),
                  leading: const Icon(Icons.account_balance_sharp),
                  actions: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.account_balance_wallet),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.remove_circle_rounded),
                    )
                  ],
                  title: const Text("MoreUI",
                      style: TextStyle(color: Colors.black)),
                  centerTitle: true,
                )
              ],
            ),
          ),
          Expanded(
              flex: 4,
              //! It just a listView with 3d scroll effect
              child: ListWheelScrollView(
                itemExtent: 50,
                children: programmingLanguages
                    .map((e) => Container(
                          width: double.infinity,
                          color:
                              Colors.red[programmingLanguages.indexOf(e) * 100],
                          height: 50,
                          child: Center(child: Text(e)),
                        ))
                    .toList(),
              )),
        ],
      )),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.black,
      //     onPressed: () {},
      //     child: const Icon(Icons.image)),
    );
  }

  Future<Image?> getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    //!since the operation of picking image from device depends on the user response time rate so the method required to be async (because it returns Future)
    //* the user under some terms of conditions won't pick an image so the image variable here is nullable
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    return Image.file(File(image.path));
  }

  Marquee marquee(BuildContext context) {
    return Marquee(
      startAfter: const Duration(seconds: 3),
      pauseAfterRound: const Duration(seconds: 3),
      blankSpace: 10,
      style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.red),
      text: "Do You Want To Get A Great Offer For This App SOURCE CODE:-)",
    );
  }

  ExpansionTile expansionTile(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.account_box_rounded),
      title: Text("account", style: Theme.of(context).textTheme.headline5)
      // ignore: prefer_const_literals_to_create_immutables
      ,
      children: [
        ListTile(
          leading: const Icon(Icons.login_outlined),
          title: Text("LogIn", style: Theme.of(context).textTheme.headline6),
        ),
      ],
    );
  }

  DropdownButton<String> dropDownButton(List<String> items) {
    String dropdownButtonValue = items.first;
    return DropdownButton<String>(
      value: dropdownButtonValue,
      items: items
          .map((language) => DropdownMenuItem(
                value: language,
                child: Text(
                  language,
                  style: const TextStyle(color: Colors.black),
                ),
              ))
          .toList(),
      onChanged: (newVal) {
        setState(() {
          dropdownButtonValue = newVal!;
        });
      },
    );
  }

  List<CheckboxListTile> checkBoxListTiles(Map<String, bool> checkBoxElements) {
    List<CheckboxListTile> result = [];
    checkBoxElements.forEach((k, v) {
      result.add(CheckboxListTile(
          //* you can use controlAffinity to change the localization for this widget (locally)
          title: Text(k),
          value: v,
          onChanged: (val) {
            setState(() {
              //! the dart usually call methods and send arguments (parameters) by reference not values
              checkBoxElements[k] = val!;
            });
          }));
    });
    return result;
  }

  RadioListTile radioButton(Gender gender) {
    return RadioListTile<Gender>(
        title: Text(
            "${gender.name[0].toUpperCase()}${gender.name.substring(1).toLowerCase()}"),
        groupValue: genderIndicator,
        value: gender,
        onChanged: (val) {
          setState(() {
            genderIndicator = val;
          });
        });
  }

  SnackBar savedStatusSnackBarWithUndo() {
    return SnackBar(
      duration: const Duration(seconds: 5),
      content: const Text("Saved The Modifications"),
      backgroundColor: Colors.red.withOpacity(0.3),
      action: SnackBarAction(
        onPressed: () {},
        label: "UnDo",
        textColor: Colors.white,
      ),
    );
  }

// ! it is Future because the dialog takes time (dependent time) to return the Dialog (AlertDialog)
  Future<dynamic> exitConfirmDialog(BuildContext context) {
    return showDialog(
        context: context,
        //! barrier is meant for the rest space of the Showed Dialogue (AlertDialog)
        barrierDismissible:
            true, //* to prevent the default pop up when pressing the blank space
        barrierColor: Colors.red.withOpacity(0.2),
        builder: (context) => AlertDialog(
              content: SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  children: [
                    const Text("Exit"),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 50),
                    const Text("Do You Want To Exit The App?"),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.green)),
                                onPressed: () =>
                                    Navigator.of(context).pop(context),
                                child: const Text("Cancel")),
                            const SizedBox(width: 20),
                            ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.red)),
                                onPressed: () =>
                                    //! the exit is used to quit from the app immediately
                                    exit(0),
                                child: const Text("Quit")),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

enum Gender { male, female }
