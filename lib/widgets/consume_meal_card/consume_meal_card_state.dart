import 'package:flutter/material.dart';
import 'package:weight_tracking_app/data/meal/meal.dart';

class ConsumeMealCardState {
  final TextEditingController mealNameController;
  final String imageURI;

  ConsumeMealCardState({required this.mealNameController, this.imageURI = ""});

  factory ConsumeMealCardState.fromMealConsumed(Meal meal) {
    return ConsumeMealCardState(
        mealNameController: TextEditingController(text: meal.name),
        imageURI: meal.imageURI ?? "");
  }
}
