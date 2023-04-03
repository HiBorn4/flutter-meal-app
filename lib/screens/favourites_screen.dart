import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

// ignore: must_be_immutable
class FavouritesScreen extends StatelessWidget {
  List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
        child: Text("You Have No Favourites YET - Start Adding Some!"),
      );
    }
    else {
      return ListView.builder(itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,

          );
      }, itemCount: favouriteMeals.length,);
    }
  }
}