import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/controllers/base/base_controller.dart';
import 'package:weight_tracking_app/data/user.dart';
import 'package:weight_tracking_app/repositories/user_repository.dart';

part 'root_controller.g.dart';

class RootController = _RootControllerBase with _$RootController;

abstract class _RootControllerBase extends BaseController<UserRepository>
    with Store {
  @observable
  bool mustCreateUser = false;

  @observable
  User? mainUser;

  @action
  void flagMustCreateUser() {
    mustCreateUser = true;
  }

  @action
  void setMainUser(User? user) {
    mainUser = user;
  }

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
            flagMustCreateUser();
          } else {
            setMainUser(users.first);
          }
        }));
  }
}
