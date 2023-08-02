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

  @Index()
  final Id id = Isar.autoIncrement;

  // TODO: SWITCH TO ISAR LINKS
  final List<MealConsumed> meals;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
