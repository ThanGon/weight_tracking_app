import 'package:isar/isar.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/base/base_controller.dart';
import 'package:weight_tracking_app/data/user.dart';

part 'root_controller.g.dart';

class RootController = _RootControllerBase with _$RootController;

abstract class _RootControllerBase extends BaseController with Store {
  final Isar _isar;

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

  _RootControllerBase(this._isar);

  void init() {
    loadMainUser();
  }

  void loadMainUser() {
    try {
      if (!_isar.isOpen) {
        throw Exception();
        //TODO: IMPLEMENT DATABASE EXCEPTION
      }

      _isar.users.where().anyId().findAll().then((users) {
        if (users.isEmpty) {
          flagMustCreateUser();
          throw Exception("Teste");
        } else {
          setMainUser(users.last);
        }
      }).catchError((error) {
        errorSnackbar(error.toString());
      });
    } catch (error) {
      errorSnackbar(error.toString());
    }
  }
}
