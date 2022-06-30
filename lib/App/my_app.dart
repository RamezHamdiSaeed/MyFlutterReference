import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // void printText(msg) {
  //   // ignore: avoid_print
  //   print("button clicked with '$msg'");
  // }
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
    return MaterialApp(
        theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.white)),
          ),
          textTheme: const TextTheme(
            button: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 1,
            ),
          ),
          primaryColor: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.add_alert),
            title: const Text('Gender'),
            // actions: const <Widget>[
            //   Icon(Icons.add),
            // ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            icon: const Icon(Icons.question_mark),
            label: const Text("info"),
            tooltip: "info about Genders",
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          body: Container(

              // padding: const EdgeInsets.only(top: 200),
              alignment: Alignment.center,
              color: Colors.white,
              // color: const Color(0x51ff0000),
              // color: const Color.fromARGB(250, 255, 0, 255),
              // color: const Color.fromRGBO(255, 0, 0, 0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.verified_user,
                          color: Colors.red,
                        ),
                        label: Text(
                          'User',
                          style: textButtonStyle(color: Colors.blue),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.developer_mode_rounded,
                          color: Colors.blue,
                        ),
                        label: Text(
                          'Developer',
                          style: textButtonStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.male_rounded,
                          color: Colors.red,
                        ),
                        label: Text(
                          'Man',
                          style: textButtonStyle(color: Colors.blue),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.female, color: Colors.blue),
                        label: Text(
                          'Woman',
                          style: textButtonStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
