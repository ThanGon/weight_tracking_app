import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../controllers/root/root_controller.dart';
import '../../controllers/setup/setup_controller.dart';
import '../../core/globals.dart';
import '../../core/schemas.dart';
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
  }

  static void _startControllers() {
    locator.registerLazySingleton<RootController>(
        () => RootController(locator.get<UserRepository>()));

    locator.registerLazySingleton<SetupController>(
        () => SetupController(locator.get<UserRepository>()));
  }
}
