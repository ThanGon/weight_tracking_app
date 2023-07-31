import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meal.dart';
import 'meal_category.dart';

part 'meal_consumed.g.dart';

@JsonSerializable()
@embedded
class MealConsumed extends Meal {
  MealConsumed({
    super.name = "Bacon and Eggs",
    super.calories = 100,
    super.category = MealCategory.lunch,
  }) : dateConsumed = DateTime.now();

  final DateTime dateConsumed;

  factory MealConsumed.fromJson(Map<String, dynamic> json) =>
      _$MealConsumedFromJson(json);

  Map<String, dynamic> toJson() => _$MealConsumedToJson(this);
}
