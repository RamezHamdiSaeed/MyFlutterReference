import 'package:flutter/material.dart';
import 'package:first_flutter_app/App/pages/blue.dart';
import 'package:first_flutter_app/App/pages/teal.dart';
import 'package:first_flutter_app/App/pages/red.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

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
              .pushReplacementNamed(route, arguments: {'color': color.value});
        },
      );
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          drawerListTile(color: Colors.blue),
          drawerListTile(color: Colors.red),
          drawerListTile(color: Colors.teal),
        ],
      ),
    );
  }
}
