import 'package:flutter/material.dart';

import '../screens/categories_meals_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/tabs_screen.dart';

import '../utils/app_routes.dart';
import '../models/meal.dart';

class CustomRoutes {

  final List<Meal> availableMeals;

  CustomRoutes({required this.availableMeals});

  static final routes = {
    AppRoutes.HOME: (BuildContext ctx) => TabsScreen(),
    AppRoutes.CATEGORIES_MEALS: (BuildContext ctx) => CategoriesMealsScreen(availableMeals),
    AppRoutes.MEAL_DETAIL: (BuildContext ctx) => MealDetailScreen(),
    AppRoutes.SETTINGS: (BuildContext ctx) => SettingsScreen(),
  };
}