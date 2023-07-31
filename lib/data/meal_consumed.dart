import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_consumed.g.dart';

@JsonSerializable()
@embedded
class MealConsumed {
  MealConsumed({
    this.name = "Bacon and Eggs",
    this.calories = 100,
  }) : dateConsumed = DateTime.now();

  final String name;

  final int calories;

  final DateTime dateConsumed;

  factory MealConsumed.fromJson(Map<String, dynamic> json) =>
      _$MealConsumedFromJson(json);

  Map<String, dynamic> toJson() => _$MealConsumedToJson(this);
}
