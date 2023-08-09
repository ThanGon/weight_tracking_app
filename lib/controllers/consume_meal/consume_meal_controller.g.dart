// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consume_meal_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConsumeMealController on _ConsumeMealController, Store {
  late final _$mealCategoryToConsumeAtom = Atom(
      name: '_ConsumeMealController.mealCategoryToConsume', context: context);

  @override
  MealCategory? get mealCategoryToConsume {
    _$mealCategoryToConsumeAtom.reportRead();
    return super.mealCategoryToConsume;
  }

  @override
  set mealCategoryToConsume(MealCategory? value) {
    _$mealCategoryToConsumeAtom.reportWrite(value, super.mealCategoryToConsume,
        () {
      super.mealCategoryToConsume = value;
    });
  }

  late final _$mealSelectedAtom =
      Atom(name: '_ConsumeMealController.mealSelected', context: context);

  @override
  Meal? get mealSelected {
    _$mealSelectedAtom.reportRead();
    return super.mealSelected;
  }

  @override
  set mealSelected(Meal? value) {
    _$mealSelectedAtom.reportWrite(value, super.mealSelected, () {
      super.mealSelected = value;
    });
  }

  late final _$_ConsumeMealControllerActionController =
      ActionController(name: '_ConsumeMealController', context: context);

  @override
  void setAllMealsAvailable(Iterable<MealBase> meals) {
    final _$actionInfo = _$_ConsumeMealControllerActionController.startAction(
        name: '_ConsumeMealController.setAllMealsAvailable');
    try {
      return super.setAllMealsAvailable(meals);
    } finally {
      _$_ConsumeMealControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMealCategoryToConsume(MealCategory? mealCategory) {
    final _$actionInfo = _$_ConsumeMealControllerActionController.startAction(
        name: '_ConsumeMealController.setMealCategoryToConsume');
    try {
      return super.setMealCategoryToConsume(mealCategory);
    } finally {
      _$_ConsumeMealControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mealCategoryToConsume: ${mealCategoryToConsume},
mealSelected: ${mealSelected}
    ''';
  }
}
