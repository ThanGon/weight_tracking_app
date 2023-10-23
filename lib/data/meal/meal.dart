import 'package:isar/isar.dart';
import 'package:weight_tracking_app/data/ingredients/ingredient.dart';
import 'package:weight_tracking_app/data/meal/meal_category.dart';

// ignore: unused_import
import 'meal_base.dart';
import 'meal_consumed.dart';

abstract class Meal {
  const Meal({
    required this.name,
    required this.calories,
    this.description,
    this.imageURI,
    this.category = MealCategory.lunch,
    this.ingredients = const [],
  });

  //BUG: ID BORKED ON MEMORY
  final Id id = Isar.autoIncrement;

  final String name;

  final String? description, imageURI;

  final int calories;

  //TODO: THINKING ABOUT IMPLEMENTING INGREDIENTS AS NESTED OBJECTS

  final List<Ingredient> ingredients;

  @enumerated
  final MealCategory category;

  MealConsumed consume() {
    return MealConsumed(
        name: name,
        calories: calories,
        category: category,
        description: description,
        imageURI: imageURI,
        ingredients: ingredients);
  }
}
