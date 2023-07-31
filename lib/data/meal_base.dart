import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weight_tracking_app/data/meal_consumed.dart';

part 'meal_base.g.dart';

@JsonSerializable()
@collection
class MealBase {
  const MealBase({
    required this.name,
    this.calories = 100,
  });

  final Id id = Isar.autoIncrement;

  final String name;

  final int calories;

  factory MealBase.fromJson(Map<String, dynamic> json) =>
      _$MealBaseFromJson(json);

  Map<String, dynamic> toJson() => _$MealBaseToJson(this);

  MealConsumed consume() {
    return MealConsumed(
      name: name,
      calories: calories,
    );
  }
}
