import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import '../meal/meal_consumed.dart';

part 'user.g.dart';

@JsonSerializable()
@collection
class User {
  const User({
    required this.name,
    this.meals = const <MealConsumed>[],
  });

  final String name;

  final Id id = Isar.autoIncrement;

  final List<MealConsumed> meals;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
