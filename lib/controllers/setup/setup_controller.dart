import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/controllers/base/base_controller.dart';
import 'package:weight_tracking_app/core/globals.dart';
import 'package:weight_tracking_app/repositories/user_repository.dart';

import '../../data/user/user.dart';
import '../../navigation/go_navigator.dart';
import '../../navigation/routes.dart';

part 'setup_controller.g.dart';

class SetupController = _SetupController with _$SetupController;

abstract class _SetupController extends BaseController<UserRepository>
    with Store, GoNavigator {
  @observable
  bool isLoading = false;

  // @observable
  // bool proceedToNextAction = false;

  // @action
  // void next() {
  //   proceedToNextAction = true;
  // }

  @action
  void toggleIsLoading() {
    isLoading = !isLoading;
  }

  final TextEditingController nameController = TextEditingController();

  _SetupController(super.repository);

  @override
  void init() {
    // TODO: implement init
  }

  void saveUser() async {
    final userCreated = User(name: nameController.text);

    toggleIsLoading();

    final result = await repository.put(userCreated);

    result.fold((error) {
      errorSnackbar(error.message);
    }, (id) {
      print("Entity added: $id");
      //TODO: Implement query to fetch data by id
      go(Globals.rootNavigatorKey, Uri(path: RoutesNavigation.home));
    });

    toggleIsLoading();
  }
}
