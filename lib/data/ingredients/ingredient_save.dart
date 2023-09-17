import 'package:isar/isar.dart';
import 'package:weight_tracking_app/data/ingredients/ingredient.dart';

part 'ingredient_save.g.dart';

@collection
class IngredientSave {
  @Index(unique: true, replace: true)
  final String name;

  final int calories;

  const IngredientSave({
    required this.name,
    required this.calories,
  });

  Id get id => Isar.autoIncrement;

  factory IngredientSave.fromIngredient(Ingredient ingredient) {
    return IngredientSave(name: ingredient.name, calories: ingredient.calories);
  }
}
