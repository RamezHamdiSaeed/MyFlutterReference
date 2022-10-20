import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

//* the shared preferences is used for non critical persistent data and commonly used for better user experience like theme changing since the user not forced to choose his best theme over and over again when returning back to the app

class _LoadingScreenState extends State<LoadingScreen> {
  String? name;
  void setPersistentNotCriticalData(String nameValue) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("name", nameValue);
  }

  void getPersistentNotCriticalData() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      (pref.containsKey("name"))
          ? name = pref.getString("name")
          : name = "you need to set the name ref using the shared preferences";
    });
  }

  void clearPersistentNotCriticalData() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

//! we need to get data from the shared preferences but if we will remove the data in any case we need to make the variable nullable
//* using initState to get the data when establish the widget (Screen)
  @override
  void initState() {
    super.initState();
    //*try to remove the below line  after running your app then recompile the app (but this time without the statement below) you will noticed that the saved data in the first run is persistent
    setPersistentNotCriticalData("Ramez Hamdi Saeed Ebrahim");
  }

//! It's good practice that if we want to clear the shared preferences when finishing the deleing with particular Widget ,so we do it in dispose built in method
//! @override
// !  void dispose() {
//!    // TODO: implement dispose
// !   super.dispose();
  //* here
// !  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("API Connection Text")),
        body: Center(
            //! the DefaultTextStyle is used to change the TextStyle of the context within its child Widget only
            child: DefaultTextStyle(
          style: const TextStyle(color: Colors.red),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "welcome Back : ${name ?? "you never entered your name sir"}"),
              ElevatedButton(
                  onPressed: getPersistentNotCriticalData,
                  child: const Text("get data from the shared preferences"))
            ],
          ),
        )));
  }
}
