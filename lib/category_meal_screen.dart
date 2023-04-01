import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key key}) : super(key: key);
  static const routeName = '/category-meals';

  // ignore: non_constant_identifier_names
  // final String CategoryId;
  // ignore: non_constant_identifier_names
  // final String CategoryTitle;
  // const CategoryMealsScreen(this.CategoryId, this.CategoryTitle, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        }, itemCount: categoryMeals.length,),
      ),
    );
  }
}