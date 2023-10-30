import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import '../meal/meal_consumed.dart';

part 'user.g.dart';

@JsonSerializable()
@collection
class User {
  User({
    required this.name,
  });

  final String name;

  @Index()
  Id id = Isar.autoIncrement;

  final IsarLinks<MealConsumed> meals = IsarLinks<MealConsumed>();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
