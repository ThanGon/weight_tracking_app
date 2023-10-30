import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weight_tracking_app/controllers/consume_meal/consume_meal_controller.dart';
import 'package:weight_tracking_app/controllers/home/home_controller.dart';

import '../../controllers/root/root_controller.dart';
import '../../controllers/setup/setup_controller.dart';
import '../../core/globals.dart';
import '../../core/schemas.dart';
import '../../repositories/meal_repository.dart';
import '../../repositories/user_repository.dart';

class DependencyInjections {
  static GetIt get locator => Globals.getIt;

  static Future<void> inject() async {
    await _startIsar();
    _startRepositories();
    _startControllers();
  }

  static Future<void> _startIsar() {
    return Future(() async {
      final dir = await getApplicationDocumentsDirectory();
      locator.registerSingletonAsync<Isar>(
          () => Isar.open(isarSchemas, directory: dir.path));
      await locator.isReady<Isar>();
    });
  }

  static void _startRepositories() {
    locator.registerLazySingleton<UserRepository>(
        () => UserRepository(locator.get<Isar>()));

    locator.registerLazySingleton<MealRepository>(
        () => MealRepository(locator.get<Isar>()));
  }

  static void _startControllers() {
    locator.registerLazySingleton<RootController>(() => RootController(
        locator.get<UserRepository>(), locator.get<MealRepository>()));

    locator.registerLazySingleton<SetupController>(
        () => SetupController(locator.get<UserRepository>()));

    locator.registerLazySingleton<HomeController>(
        () => HomeController(locator.get<MealRepository>()));

    locator.registerLazySingleton<ConsumeMealController>(() =>
        ConsumeMealController(
            locator.get<MealRepository>(), locator.get<UserRepository>()));
  }
}
