import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable()
@embedded
class Ingredient {
  final String name;
  final int calories;

  const Ingredient({
    this.name = "",
    this.calories = 0,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
