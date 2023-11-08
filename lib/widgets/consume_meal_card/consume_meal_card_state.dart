import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/data/meal/meal.dart';
import 'package:weight_tracking_app/widgets/consume_meal_card/ingredient_meal_card_state.dart';

class ConsumeMealCardState {
  final TextEditingController mealNameController;
  final TextEditingController caloriesController;
  final String imageURI;
  late final ObservableList<IngredientMealCardState> ingredients;

  ConsumeMealCardState(
      {required this.mealNameController,
      required this.caloriesController,
      this.imageURI = "",
      List<IngredientMealCardState> ingredients = const []})
      : ingredients = ObservableList.of(ingredients);

  ConsumeMealCardState.fromMeal(Meal meal)
      : mealNameController = TextEditingController(text: meal.name),
        caloriesController =
            TextEditingController(text: meal.calories.toString()),
        imageURI = meal.imageURI ?? "" {
    ingredients = ObservableList.of(meal.ingredients.map((e) =>
        IngredientMealCardState.fromIngredient(e,
            onChangedCalories: onChangedCalories)));
  }

  void onChangedCalories() {
    caloriesController.text = ingredients
        .map((e) => e.calories.text.isEmpty ? 0 : int.parse(e.calories.text))
        .fold(0, (previousValue, element) => previousValue + element)
        .toString();
  }
}
