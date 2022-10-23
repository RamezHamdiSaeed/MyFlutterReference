import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> carouselSliderImages = [
    "assets/images/carouselSlider/s1.jpg",
    "assets/images/carouselSlider/s2.jpg",
    "assets/images/carouselSlider/s3.jpg"
  ];
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
              child: ListView(
            children: [
              const Center(
                  child: Text("carousel Slider for images or cards...")),
              const SizedBox(
                height: 20,
              ),
              //! you can use CarouselSlider as same as ListView () and ListView.builder (CarouselSlider() and CarouselSlider.builder())
              CarouselSlider.builder(
                  itemCount: carouselSliderImages.length,
                  itemBuilder: (context, index, pageIndex) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          carouselSliderImages[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                  options: CarouselOptions(
                      autoPlay: true,
                      height: MediaQuery.of(context).size.height / 3))
            ],
          )),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          child: const Icon(Icons.save)),
    );
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
