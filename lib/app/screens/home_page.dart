import 'dart:io';
import 'package:flutter/material.dart';

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

  int radioButtonIndex = 0;
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
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListView(
                  children: [
                    // Center(
                    //     child: Text(
                    //   "What Are Your Programming Languages?",
                    //   style: Theme.of(context).textTheme.headline5,
                    // )),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: ExpansionTile(
                      leading: const Icon(Icons.account_box_rounded),
                      title: Text("account",
                          style: Theme.of(context).textTheme.headline5)
                      // ignore: prefer_const_literals_to_create_immutables
                      ,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.login_outlined),
                          title: Text("LogIn",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ],
                    ))
                  ],
                ),
              )),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          child: const Icon(Icons.save)),
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
