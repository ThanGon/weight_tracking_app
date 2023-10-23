import 'package:flutter/material.dart';

import '../../data/ingredients/ingredient.dart';

class IngredientMealCardState {
  final TextEditingController name;
  final TextEditingController calories;

  const IngredientMealCardState({required this.name, required this.calories});

  factory IngredientMealCardState.fromIngredient(Ingredient ingredient) {
    return IngredientMealCardState(
        name: TextEditingController(text: ingredient.name),
        calories: TextEditingController(text: ingredient.calories.toString()));
  }
}
