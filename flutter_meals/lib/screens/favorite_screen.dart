import 'package:flutter/material.dart';

import '../components/meal_item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    }

    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (context, index) {
        return MealItem(favoriteMeals[index]);
      },
    );
  }
}
