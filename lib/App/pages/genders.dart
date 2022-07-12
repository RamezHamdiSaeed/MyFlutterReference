// import 'package:first_flutter_app/App/components/changing_fab_tooltip.dart';

import 'package:flutter/material.dart';
// import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
// import 'package:first_flutter_app/App/models/age.dart';
import 'package:first_flutter_app/App/pages/blue.dart';
import 'package:first_flutter_app/App/pages/teal.dart';
import 'package:first_flutter_app/App/pages/red.dart';

class Genders extends StatefulWidget {
  const Genders({Key? key}) : super(key: key);

  @override
  State<Genders> createState() => _GendersState();
}

class _GendersState extends State<Genders> {
  // TextStyle textButtonStyle({required Color color}) {
  //   return TextStyle(color: color, shadows: <Shadow>[
  //     Shadow(
  //       color: color,
  //       offset: const Offset(5, 5),
  //       blurRadius: 10,
  //     )
  //   ]);
  // }

  // DateTime selectedDateTime = DateTime.now();

  int bNBIndex = 0;
  changeNBIndex(int index) {
    setState(() {
      bNBIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Identity> identities = [
    //   Identity(yearOfBirth: "1998"),
    //   Identity(yearOfBirth: "1997"),
    //   Identity(yearOfBirth: "2000"),
    //   Identity(yearOfBirth: "2002")
    // ];
    // TextStyle ageTextStyle = const TextStyle(fontSize: 20);
    //! not when we need to change the widget by specific variable/s we need to assure that the variable/s is/are not within the build method
    // DateTime selectedDateTime = DateTime.now();

    // DateTime minAge({required int age}) {
    //   return DateTime(DateTime.now().year - age);
    // }
    // InkWell dummyContainer(Color customColor, {int customFlex = 1}) {
    //   return InkWell(
    //     onTap: () {
    //       //! if we have multiple page with common condition we supposed to use Navigator.pushNamed("/blue");
    //       //* pushReplacement will replace the current page with the new page for memory usage sake but we don't use it here because there will no replicated screens on the stack
    //       //! we can pass data as a prop to the widget representing the page we want to navigate to with some class (Widget) configurations.
    //       if (customColor == Colors.red) {
    //         Navigator.of(context).pushNamed(RedScreen.routName,
    //             arguments: {'color': customColor.value});
    //       } else if (customColor == Colors.teal) {
    //         Navigator.of(context).pushNamed(TealScreen.routName,
    //             arguments: {'color': customColor.value});
    //       } else {
    //         Navigator.of(context).pushNamed(BlueScreen.routName,
    //             arguments: {'color': customColor.value});
    //       }
    //     },
    //     child: Container(
    //       height: 60.0,
    //       decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //               begin: Alignment.topLeft,
    //               end: Alignment.bottomRight,
    //               colors: <Color>[
    //                 customColor.withOpacity(0.5),
    //                 customColor,
    //               ]),
    //           color: customColor),
    //       padding: const EdgeInsets.all(20.0),
    //       child: Text("${customColor.value.toString()} Screen"),
    //     ),
    //   );
    // }

    // var datePicker = Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
    //     child: Container(
    //       alignment: Alignment.center,
    //       child: ElevatedButton(
    //           child: Text("$selectedDateTime"),
    //           onPressed: () {
    //             showDatePicker(
    //                     context: context,
    //                     initialDate: minAge(age: 18),
    //                     firstDate: minAge(age: 50),
    //                     lastDate: DateTime.now())
    //                 .then((value) {
    //               if (value == null) {
    //                 return;
    //               }
    //               setState(() {
    //                 selectedDateTime = value;
    //               });
    //             });
    //           }),
    //       //! in case of using url for image we use another named constructor called Image.network
    //       // child: Image.asset(
    //       //   "assets/images/Self.png",
    //       //   fit: BoxFit.cover,
    //       //   // width: 200.0,
    //       // )
    //     ),
    //   );
    // var bodyContent1 = Padding(
    //   padding: const EdgeInsets.all(20.0),
    //   child: GridView(
    //       //* the gridView is same as listView since there are another named constructor called .builder for both of them
    //       //* we can create grid using column of row or row of columns but we the grid will not be flexible for different screen state like (portrait or landscape) and more other reasons like (it support the scroll).
    //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //           maxCrossAxisExtent: 200,
    //           //! the below ratio means 3 in width and 1 in height (aspect ratio)
    //           childAspectRatio: 3 / 2,
    //           //! we treat the GridView as a Column so they have the same main and cross axis
    //           mainAxisSpacing: 10,
    //           crossAxisSpacing: 20),
    //       children: <Widget>[
    //         dummyContainer(Colors.red, customFlex: 2),
    //         dummyContainer(Colors.teal, customFlex: 3),
    //         dummyContainer(Colors.blue, customFlex: 5),
    //       ]),
    // );
    List<Map<String, dynamic>> internalScreens = [
      {"title": "Reddit", "icon": const Icon(Icons.reddit)},
      {"title": "Cloud", "icon": const Icon(Icons.cloud_off_rounded)},
      {"title": "Colorize", "icon": const Icon(Icons.colorize)}
    ];
    List<Tab> pages = [
      Tab(icon: internalScreens[0]["icon"], text: internalScreens[0]["title"]),
      Tab(icon: internalScreens[1]["icon"], text: internalScreens[1]["title"]),
      Tab(icon: internalScreens[2]["icon"], text: internalScreens[2]["title"]),
    ];
//* to make internal routing (to add Scaffold within Scaffold through events usually in AppBar (bottom))
    // var bottomBarWithSheet = BottomBarWithSheet(
    //   mainActionButtonTheme: const MainActionButtonTheme(color: Colors.teal),
    //   bottomBarTheme: const BottomBarTheme(
    //     mainButtonPosition: MainButtonPosition.middle,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    //     ),
    //     itemIconColor: Colors.teal,
    //     itemTextStyle: TextStyle(
    //       color: Colors.teal,
    //       fontSize: 10.0,
    //     ),
    //     selectedItemTextStyle: TextStyle(
    //       color: Colors.teal,
    //       fontSize: 10.0,
    //     ),
    //   ),
    //   //* the below statement is used for items with main action button
    //   // onSelectItem: (index) => debugPrint('$index'),
    //   sheetChild: Center(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 0),
    //       child: ListView.builder(
    //         // mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         itemCount: 3,
    //         itemBuilder: (context, index) {
    //           return Column(children: <Widget>[
    //             //! I don't need to use map just we need to use spread operator (...)
    //             // ...textFields,
    //             Padding(
    //               padding: const EdgeInsets.all(20.0),
    //               child: Card(
    //                 shadowColor: Colors.grey,
    //                 elevation: 2.0,
    //                 color: Colors.white24,
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                       children: [
    //                         Text(identities[index].age, style: ageTextStyle),
    //                         Text(identities[index].yearOfBirth,
    //                             style: ageTextStyle)
    //                       ]),
    //                 ),
    //               ),
    //             ),
    //           ]);
    //         }

    //         //! we used stack here to make a postfix text indirectly using Stack widget just for practising only

    //         ,
    //       ),
    //     ),
    //   ),
    //   items: const [],
    // );
    // const tabBar = const TabBar(
    //   tabs: <Widget>[
    //     Tab(
    //       text: "Reddit",
    //     ),
    //     Tab(
    //       text: "Cloud",
    //     ),
    //     Tab(
    //       text: "Colorize",
    //     ),
    //   ],
    // );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              drawerListTile(color: Colors.blue),
              drawerListTile(color: Colors.red),
              drawerListTile(color: Colors.teal),
            ],
          ),
        ),
        drawerScrimColor: Theme.of(context).primaryColor.withOpacity(0.5),
        appBar: AppBar(
          // leading: const Icon(Icons.add_alert),
          title: Text(internalScreens[bNBIndex]["title"]),
          // bottom: tabBar,
          // actions: const <Widget>[
          //   Icon(Icons.add),
          // ],
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        //* there is no stretch value for mainAxisAlignment so we need to expand ,or when we want to specify the (grid)areas of layout
        body: Center(child: pages[bNBIndex])
        //  TabBarView(children: pages)
        ,

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bNBIndex,
          backgroundColor: Colors.teal,
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white,
          onTap: changeNBIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.reddit), label: "Reddit"),
            BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Cloud"),
            BottomNavigationBarItem(
                icon: Icon(Icons.colorize), label: "Colorize"),
          ],
        )
        // bottomBarWithSheet
        ,
      ),
    );
  }

  ListTile drawerListTile({required Color color}) {
    late String route;
    if (color == Colors.red) {
      route = RedScreen.routName;
    } else if (color == Colors.teal) {
      route = TealScreen.routName;
    } else if (color == Colors.blue) {
      route = BlueScreen.routName;
    }
    return ListTile(
      title: Text(route.replaceFirst('/', '').replaceFirst('S', ' S')),
      trailing: Icon(
        Icons.forward,
        color: color,
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(route, arguments: {'color': color.value});
      },
    );
  }
}
