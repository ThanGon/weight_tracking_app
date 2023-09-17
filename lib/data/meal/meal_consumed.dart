import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import '../ingredients/ingredient.dart';
import '../user/user.dart';
import 'meal.dart';
import 'meal_category.dart';

part 'meal_consumed.g.dart';

@JsonSerializable()
@collection
class MealConsumed extends Meal {
  MealConsumed({
    super.name = "Bacon and Eggs",
    super.calories = 100,
    super.description =
        "Bacon and eggs is a dish consisting of bacon and eggs.",
    super.imageURI,
    super.category = MealCategory.lunch,
  }) : dateConsumed = DateTime.now();

  // @Index()
  // final id = Isar.autoIncrement;

  @Index()
  final DateTime dateConsumed;

  @Backlink(to: 'meals')
  final IsarLink<User> user = IsarLink<User>();

  factory MealConsumed.fromJson(Map<String, dynamic> json) =>
      _$MealConsumedFromJson(json);

  Map<String, dynamic> toJson() => _$MealConsumedToJson(this);
}
