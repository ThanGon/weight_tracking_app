import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weight_tracking_app/widgets/consume_meal_card/consume_meal_card_state.dart';

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
    super.ingredients = const [],
  }) : dateConsumed = DateTime.now();

  // @Index()
  // final id = Isar.autoIncrement;

  @Index()
  final DateTime dateConsumed;

  @Backlink(to: 'meals')
  final IsarLink<User> user = IsarLink<User>();

  factory MealConsumed.fromConsumeMealCardState(ConsumeMealCardState state) {
    return MealConsumed(
        name: state.mealNameController.text,
        calories: int.parse(state.caloriesController.text),
        // category: state.,
        // description: state.des,
        // imageURI: meal.imageURI,
        ingredients: state.ingredients
            .map((e) => Ingredient(
                name: e.name.text, calories: int.parse(e.calories.text)))
            .toList());
  }

  factory MealConsumed.fromJson(Map<String, dynamic> json) =>
      _$MealConsumedFromJson(json);

  Map<String, dynamic> toJson() => _$MealConsumedToJson(this);
}
