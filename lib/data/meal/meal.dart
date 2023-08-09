import 'package:isar/isar.dart';
import 'package:weight_tracking_app/data/meal/meal_category.dart';

import 'meal_consumed.dart';

abstract class Meal {
  Meal({
    required this.name,
    required this.calories,
    this.description,
    this.imageURI,
    this.category = MealCategory.lunch,
  });

  final Id id = Isar.autoIncrement;

  final String name;

  final String? description, imageURI;

  final int calories;

  @enumerated
  final MealCategory category;

  MealConsumed consume() {
    return MealConsumed(
        name: name,
        calories: calories,
        category: category,
        description: description,
        imageURI: imageURI);
  }
}
