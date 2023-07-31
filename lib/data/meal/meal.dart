import 'package:isar/isar.dart';
import 'package:weight_tracking_app/data/meal/meal_category.dart';

import 'meal_consumed.dart';

abstract class Meal {
  Meal({
    required this.name,
    required this.calories,
    this.category = MealCategory.lunch,
  });

  final String name;

  final int calories;

  @enumerated
  final MealCategory category;

  MealConsumed consume() {
    return MealConsumed(name: name, calories: calories, category: category);
  }
}
