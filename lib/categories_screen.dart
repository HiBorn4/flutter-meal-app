import 'package:flutter/material.dart';
import 'package:meal/category_item.dart';
import 'package:meal/dummy_data.dart';

// ignore: camel_case_types
class Categories_Screen extends StatelessWidget {
  const Categories_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DeliMeal")),
      body: GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map(
        (catData) => CategroyItem(
          catData.title,
          catData.color)).toList(),
    ),
    );
  }
}
