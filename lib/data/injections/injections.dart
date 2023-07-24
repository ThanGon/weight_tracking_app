import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weight_tracking_app/data/user.dart';
import 'package:weight_tracking_app/globals.dart';
import 'package:weight_tracking_app/pages/root/root_controller.dart';

class DependencyInjections {
  static Future<void> inject() async {
    await _startIsar();
    _startControllers();
  }

  static Future<void> _startIsar() {
    return Future(() async {
      final dir = await getApplicationDocumentsDirectory();
      getIt.registerSingletonAsync<Isar>(
          () => Isar.open([UserSchema], directory: dir.path));
      await getIt.isReady<Isar>();
    });
  }

  static void _startControllers() {
    getIt.registerLazySingleton<RootController>(
        () => RootController(getIt.get<Isar>()));
  }
}
