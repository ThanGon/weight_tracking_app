// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  Computed<MealCategory?>? _$recommendedMealCategoryComputed;

  @override
  MealCategory? get recommendedMealCategory =>
      (_$recommendedMealCategoryComputed ??= Computed<MealCategory?>(
              () => super.recommendedMealCategory,
              name: '_HomeController.recommendedMealCategory'))
          .value;

  late final _$profileAtom =
      Atom(name: '_HomeController.profile', context: context);

  @override
  User? get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(User? value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  dynamic setProfile(User profile) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setProfile');
    try {
      return super.setProfile(profile);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearMealsConsumed() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.clearMealsConsumed');
    try {
      return super.clearMealsConsumed();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAllMealConsumed(Iterable<Meal> meals) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.addAllMealConsumed');
    try {
      return super.addAllMealConsumed(meals);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profile: ${profile},
recommendedMealCategory: ${recommendedMealCategory}
    ''';
  }
}
