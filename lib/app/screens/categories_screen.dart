import 'package:flutter/material.dart';
import 'package:my_flutter_reference/app/widgets/category_element.dart';
import 'package:my_flutter_reference/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          "Meals Categories",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: MediaQuery.of(context).size.height / 4,
            mainAxisSpacing: 23.0,
            crossAxisSpacing: 23.0,
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          ),
          itemCount: dummyCategories.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryElement(
                color: dummyCategories[index].color,
                title: dummyCategories[index].title);
          },
        ),
      ),
    );
  }
}
