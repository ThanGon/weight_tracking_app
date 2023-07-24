import 'package:isar/isar.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/data/user.dart';

part 'root_controller.g.dart';

class RootController = _RootControllerBase with _$RootController;

abstract class _RootControllerBase with Store {
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
        } else {
          setMainUser(users.last);
        }
      });
    } catch (ex) {
      print(ex);
      //TODO: IMPLEMENT ERROR HANDLING WITH SNACKBAR
    }
  }
}
