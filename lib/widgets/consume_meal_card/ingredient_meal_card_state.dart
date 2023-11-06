import 'package:flutter/material.dart';

import '../../data/ingredients/ingredient.dart';

class IngredientMealCardState {
  final TextEditingController name;
  final TextEditingController calories;
  final VoidCallback? onChangedCalories;

  const IngredientMealCardState(
      {required this.name, required this.calories, this.onChangedCalories});

  factory IngredientMealCardState.fromIngredient(Ingredient ingredient,
      {VoidCallback? onChangedCalories}) {
    return IngredientMealCardState(
        name: TextEditingController(text: ingredient.name),
        calories: TextEditingController(text: ingredient.calories.toString()),
        onChangedCalories: onChangedCalories);
  }
}
