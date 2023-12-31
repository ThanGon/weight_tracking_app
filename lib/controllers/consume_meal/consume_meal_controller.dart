import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/controllers/base/base_controller.dart';
import 'package:weight_tracking_app/data/meal/meal_base.dart';
import 'package:weight_tracking_app/repositories/meal_repository.dart';
import 'package:weight_tracking_app/repositories/user_repository.dart';

import '../../data/meal/meal.dart';
import '../../data/meal/meal_category.dart';

part 'consume_meal_controller.g.dart';

class ConsumeMealController = _ConsumeMealController
    with _$ConsumeMealController;

abstract class _ConsumeMealController extends BaseController<MealRepository>
    with Store {
  final UserRepository _userRepository;
  _ConsumeMealController(super.repository, this._userRepository);

  @observable
  MealCategory? mealCategoryToConsume;

  final ObservableList<MealBase> mealsAvailable = ObservableList.of([]);

  @action
  void setAllMealsAvailable(Iterable<MealBase> meals) {
    mealsAvailable.clear();
    mealsAvailable.addAll(meals);
    mealsAvailable.add(
        MealBase(name: 'Other', calories: 0, category: mealCategoryToConsume!));
  }

  @observable
  Meal? mealSelected;

  @action
  void setMealCategoryToConsume(MealCategory? mealCategory) {
    mealCategoryToConsume = mealCategory;
    _getMealsAvailableByCategory();
  }

  @action
  void setMealSelected(Meal? meal) {
    if (mealSelected?.name == meal?.name) {
      mealSelected = null;
      return;
    }
    mealSelected = meal;
  }

  @override
  void init() {
    _getMealsAvailableByCategory();
  }

  Future<void> _getMealsAvailableByCategory() async {
    final result =
        await repository.queryMealsByCategory(mealCategoryToConsume!);

    result.fold((error) {
      errorSnackbar("Couldn't fetch meals on the chosen category");
    }, (meals) {
      // meals.addAll(Iterable.generate(
      //     20,
      //     (index) => MealBase(
      //         name: 'Meal $index',
      //         calories: 100,
      //         category: mealCategoryToConsume!)));
      setAllMealsAvailable(meals);
    });
  }

  Future<void> consumeMeal() async {
    final result = await _userRepository.queryById(1);

    result.fold((error) {
      errorSnackbar("Something went wrong while fetching user");
    }, (user) async {
      final mealConsumed = mealSelected!.consume();
      mealConsumed.user.value = user;

      final result = await repository.saveMealConsumed(mealConsumed);

      result.fold((error) {
        errorSnackbar("Something went wrong while saving meal consumed");
      }, (_) {
        successSnackbar("Meal consumed successfully");
      });
    });
  }

  void onChangedCaloriesCallback() {}
}
