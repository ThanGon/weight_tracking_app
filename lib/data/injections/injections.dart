import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weight_tracking_app/controllers/root/root_controller.dart';
import 'package:weight_tracking_app/controllers/setup/setup_controller.dart';
import 'package:weight_tracking_app/data/user.dart';
import 'package:weight_tracking_app/globals.dart';
import 'package:weight_tracking_app/repositories/user_repository.dart';

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
          () => Isar.open([UserSchema], directory: dir.path));
      await locator.isReady<Isar>();
    });
  }

  static void _startRepositories() {
    locator.registerLazySingleton<UserRepository>(
        () => UserRepository(locator.get<Isar>()));
  }

  static void _startControllers() {
    locator.registerLazySingleton<RootController>(
        () => RootController(locator.get<UserRepository>()));

    locator.registerLazySingleton<SetupController>(
        () => SetupController(locator.get<UserRepository>()));
  }
}
