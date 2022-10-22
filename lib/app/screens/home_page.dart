import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MoreUI"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
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
