import 'dart:ui';

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
            showToast("Your Empty App Is Hacked :-) ",
                context: context,
                duration: const Duration(seconds: 3),
                position: const StyledToastPosition(align: Alignment.center));
          },
          child: const Icon(Icons.warning)),
    );
  }
}
