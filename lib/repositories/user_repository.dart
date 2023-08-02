import 'package:weight_tracking_app/repositories/base/base_repository.dart';

import '../data/user/user.dart';

class UserRepository extends BaseRepository<User> {
  UserRepository(super.isar);

  // Future<List<Meal>> queryMealsByUserId(int userId, {DateTime? date}) {
  //   return isar
  //       .users.where().idEqualTo(userId).filter().mealsElement((q) {
  //         final value = date ?? (DateTime.now() - Duration(days: 1));
  //         return q.dateConsumedGreaterThan(value)
  //       }).findAll() ;
  // }

  //TODO: MEALS CONSUMED WILL BE A COLLECTION WITH A LINK TO USER
}
