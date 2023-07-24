import 'package:isar/isar.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/data/injections/injections.dart';
import 'package:weight_tracking_app/data/user.dart';
import 'package:weight_tracking_app/globals.dart';

part 'root_controller.g.dart';

class RootController = _RootControllerBase with _$RootController;

abstract class _RootControllerBase with Store {
  late final Isar _isar;

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

  void init() {
    //FIXME: REWORK SELF INJECTION
    DependencyInjections.inject().then((v) {
      _isar = getIt.get<Isar>();
      loadMainUser();
    });
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
