import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
//* adding leading Icon
//* adding trailing Icons by passing them to actions
//! using customized app bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.white, Colors.black])),
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
            title: const Text("MoreUI", style: TextStyle(color: Colors.black)),
            centerTitle: true,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          //! you need to pass the context
          onPressed: () {
            exitConfirmDialog(context);
          },
          child: const Icon(Icons.warning)),
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
