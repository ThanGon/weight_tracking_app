import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/controllers/base/base_controller.dart';
import 'package:weight_tracking_app/core/globals.dart';
import 'package:weight_tracking_app/navigation/go_navigator.dart';
import 'package:weight_tracking_app/navigation/routes.dart';
import 'package:weight_tracking_app/repositories/user_repository.dart';

part 'root_controller.g.dart';

class RootController = _RootControllerBase with _$RootController;

abstract class _RootControllerBase extends BaseController<UserRepository>
    with Store, GoNavigator {
  _RootControllerBase(super.repository);

  @override
  void init() {
    print("Root Controller Loaded");
    loadMainUser();
  }

  void loadMainUser() {
    repository.queryAll().then((either) => either.fold((error) {
          errorSnackbar(error.message);
        }, (users) {
          if (users.isEmpty) {
            pushReplacement(
                Globals.rootNavigatorKey, Uri(path: RoutesNavigation.setup));
          } else {
            go(Globals.rootNavigatorKey, Uri(path: RoutesNavigation.home));
          }
        }));
  }
}
