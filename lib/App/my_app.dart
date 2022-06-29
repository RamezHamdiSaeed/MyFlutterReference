import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.add_alert),
            title: const Text('Gender'),
            // actions: const <Widget>[
            //   Icon(Icons.add),
            // ],
          ),
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
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.verified_user,
                          color: Colors.red,
                        ),
                        label: const Text(
                          'User',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(5, 5),
                                blurRadius: 10,
                                color: Colors.blue,
                              ),
                            ],
                            // decoration: TextDecoration.combine(<TextDecoration>[
                            //   TextDecoration.underline,
                            //   TextDecoration.lineThrough
                            // ]),
                          ),
                        ),
                      ),
                      TextButton.icon(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.developer_mode_rounded,
                          color: Colors.blue,
                        ),
                        label: const Text(
                          'Developer',
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(5, 5),
                                blurRadius: 10,
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextButton.icon(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.male_rounded,
                          color: Colors.red,
                        ),
                        label: const Text(
                          'Man',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(5, 5),
                                blurRadius: 10,
                                color: Colors.blue,
                              ),
                            ],
                            // decoration: TextDecoration.combine(<TextDecoration>[
                            //   TextDecoration.underline,
                            //   TextDecoration.lineThrough
                            // ]),
                          ),
                        ),
                      ),
                      TextButton.icon(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.female, color: Colors.blue),
                        label: const Text(
                          'Woman',
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(5, 5),
                                blurRadius: 10,
                                color: Colors.pink,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }
}
