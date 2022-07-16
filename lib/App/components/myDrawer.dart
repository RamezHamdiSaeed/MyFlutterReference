import 'package:flutter/material.dart';
import 'package:first_flutter_app/App/pages/blue.dart';
import 'package:first_flutter_app/App/pages/teal.dart';
import 'package:first_flutter_app/App/pages/red.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<Widget> attachedLVWidgets = [];

  @override
  Widget build(BuildContext context) {
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
              .pushNamed(route, arguments: {'color': color.value}).then(
            (value) {
              setState(() {
                attachedLVWidgets.add(AlertDialog(
                  title: const Text("AlertDialog"),
                  content: Text("AlertDialog with value: $value"),
                ));
              });
            },
          );
        },
      );
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          drawerListTile(color: Colors.blue),
          drawerListTile(color: Colors.red),
          drawerListTile(color: Colors.teal),
          ...attachedLVWidgets,
        ],
      ),
    );
  }
}
