import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:weight_tracking_app/data/meal/meal_base.dart';
import 'package:weight_tracking_app/data/meal/meal_category.dart';
import 'package:weight_tracking_app/data/meal/meal_consumed.dart';
import 'package:weight_tracking_app/data/user/user.dart';
import 'package:weight_tracking_app/repositories/base/base_repository.dart';

import '../data/meal/meal.dart';

class MealRepository extends BaseRepository<MealBase> {
  MealRepository(super.isar);

  /// QUERY NEEDS LOWER AND UPPER BOUNDS FOR DATE
  Future<Either<IsarError, List<MealConsumed>>> queryMealsConsumedByDate(
      DateTime dateLower, DateTime dateUpper,
      {int userId = 1}) async {
    try {
      final meals = await isar.mealConsumeds
          .where()
          .dateConsumedBetween(dateLower, dateUpper)
          .filter()
          .user((u) => u.idEqualTo(userId))
          .findAll();

      return right(meals);
    } on IsarError catch (ex) {
      return left(ex);
    }
  }

  Future<Either<IsarError, List<MealBase>>> queryMealsByCategory(
      MealCategory category) async {
    try {
      final meals =
          await isar.mealBases.filter().categoryEqualTo(category).findAll();

      return right(meals);
    } on IsarError catch (ex) {
      return left(ex);
    }
  }

  Future<Either<IsarError, void>> saveMealConfig(Meal meal) async {
    try {
      await isar.writeTxn(() async {
        await isar.mealBases.put(MealBase.fromMeal(meal));
      });
      return right(null);
    } on IsarError catch (ex) {
      return left(ex);
    }
  }

  Future<Either<IsarError, void>> saveMealConsumed(MealConsumed meal) async {
    try {
      await isar.writeTxn(() async {
        await isar.mealConsumeds.put(meal);
        meal.user.value!.id = await isar.users.put(meal.user.value!);
        await meal.user.save();
      });

      return right(null);
    } on IsarError catch (ex) {
      return left(ex);
    }
  }
}
