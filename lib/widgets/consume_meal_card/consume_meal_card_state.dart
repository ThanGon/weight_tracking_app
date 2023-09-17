import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/data/ingredients/ingredient.dart';
import 'package:weight_tracking_app/data/meal/meal.dart';

class ConsumeMealCardState {
  final TextEditingController mealNameController;
  final TextEditingController caloriesController;
  final String imageURI;
  final ObservableList<Ingredient> ingredients;

  ConsumeMealCardState(
      {required this.mealNameController,
      required this.caloriesController,
      this.imageURI = "",
      List<Ingredient> ingredients = const []})
      : ingredients = ObservableList.of(ingredients);

  factory ConsumeMealCardState.fromMealConsumed(Meal meal) {
    return ConsumeMealCardState(
        mealNameController: TextEditingController(text: meal.name),
        caloriesController:
            TextEditingController(text: meal.calories.toString()),
        imageURI: meal.imageURI ?? "",
        ingredients: meal.ingredients);
  }
}
