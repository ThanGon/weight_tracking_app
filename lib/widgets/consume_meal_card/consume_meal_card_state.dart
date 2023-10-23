import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/data/meal/meal.dart';
import 'package:weight_tracking_app/widgets/consume_meal_card/ingredient_meal_card_state.dart';

class ConsumeMealCardState {
  final TextEditingController mealNameController;
  final TextEditingController caloriesController;
  final String imageURI;
  final ObservableList<IngredientMealCardState> ingredients;

  ConsumeMealCardState(
      {required this.mealNameController,
      required this.caloriesController,
      this.imageURI = "",
      List<IngredientMealCardState> ingredients = const []})
      : ingredients = ObservableList.of(ingredients);

  factory ConsumeMealCardState.fromMealConsumed(Meal meal) {
    return ConsumeMealCardState(
        mealNameController: TextEditingController(text: meal.name),
        caloriesController:
            TextEditingController(text: meal.calories.toString()),
        imageURI: meal.imageURI ?? "",
        ingredients: List<IngredientMealCardState>.from(meal.ingredients
            .map((e) => IngredientMealCardState.fromIngredient(e))));
  }
}
