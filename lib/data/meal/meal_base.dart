import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meal.dart';
import 'meal_category.dart';

part 'meal_base.g.dart';

@JsonSerializable()
@collection
class MealBase extends Meal {
  MealBase(
      {required super.name, required super.calories, required super.category, super.description, super.imageURI});

  final Id id = Isar.autoIncrement;

  factory MealBase.fromJson(Map<String, dynamic> json) =>
      _$MealBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MealBaseToJson(this);
}
