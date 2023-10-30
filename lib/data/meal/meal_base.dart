import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import '../ingredients/ingredient.dart';
import 'meal.dart';
import 'meal_category.dart';

part 'meal_base.g.dart';

@JsonSerializable()
@collection
class MealBase extends Meal {
  MealBase(
      {required super.name,
      required super.calories,
      required super.category,
      super.description,
      super.imageURI,
      super.ingredients = const []});

  // final Id id = Isar.autoIncrement;

  factory MealBase.fromMeal(Meal meal) {
    return MealBase(
        name: meal.name,
        calories: meal.calories,
        category: meal.category,
        description: meal.description,
        imageURI: meal.imageURI,
        ingredients: meal.ingredients);
  }

  factory MealBase.fromJson(Map<String, dynamic> json) =>
      _$MealBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MealBaseToJson(this);
}
