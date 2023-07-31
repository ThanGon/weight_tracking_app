import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/controllers/base/base_controller.dart';
import 'package:weight_tracking_app/data/meal/meal_base.dart';
import 'package:weight_tracking_app/navigation/go_navigator.dart';
import 'package:weight_tracking_app/repositories/meal_repository.dart';
import 'package:weight_tracking_app/repositories/user_repository.dart';

import '../../core/globals.dart';
import '../../navigation/routes.dart';

part 'root_controller.g.dart';

class RootController = _RootControllerBase with _$RootController;

abstract class _RootControllerBase extends BaseController<UserRepository>
    with Store, GoNavigator {
  final MealRepository mealRepository;

  late final AssetBundle defaultAssetBundle;

  bool mustCreateUser = false;
  bool mealsSeeded = false;

  _RootControllerBase(super.repository, this.mealRepository);

  @override
  void init() async {
    print("Root Controller Loaded");
    await _loadMainUser();
    await _seedMeals();
    _nextRoute();
  }

  Future<void> _loadMainUser() async {
    await repository.queryAll().then((either) => either.fold((error) {
          errorSnackbar("Fatal: ${error.message}");
        }, (users) {
          mustCreateUser = users.isEmpty;
        }));
  }

  Future<void> _seedMeals() async {
    var result = await mealRepository.queryAll();

    await result.fold((error) {
      errorSnackbar("Fatal: ${error.message}");
    }, (meals) async {
      if (meals.isEmpty) {
        print("Seeding meals");

        final List<dynamic> seed = jsonDecode(
            await defaultAssetBundle.loadString("assets/data/meal_seed.json"));
        final mealsSeed =
            List<MealBase>.from(seed.map((e) => MealBase.fromJson(e)));

        final result = await mealRepository.putAll(mealsSeed);

        result.fold((error) {
          errorSnackbar("Fatal: ${error.message}");
        }, (ids) {
          mealsSeeded = true;
        });
      } else {
        mealsSeeded = true;
      }
    });
  }

  void _nextRoute() {
    if (mealsSeeded) {
      if (mustCreateUser) {
        go(Globals.rootNavigatorKey, Uri(path: RoutesNavigation.setup));
      } else {
        go(Globals.rootNavigatorKey, Uri(path: RoutesNavigation.home));
      }
    } else {
      throw Exception("Meals not seeded");
    }
  }
}
