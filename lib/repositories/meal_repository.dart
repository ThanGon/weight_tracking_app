import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:weight_tracking_app/data/meal/meal_consumed.dart';
import 'package:weight_tracking_app/data/user/user.dart';
import 'package:weight_tracking_app/repositories/base/base_repository.dart';

import '../data/meal/meal_base.dart';

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
}
