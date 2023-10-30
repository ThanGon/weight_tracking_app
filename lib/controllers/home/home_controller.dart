import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/controllers/base/base_controller.dart';
import 'package:weight_tracking_app/data/meal/meal.dart';
import 'package:weight_tracking_app/data/meal/meal_category.dart';
import 'package:weight_tracking_app/navigation/go_navigator.dart';
import 'package:weight_tracking_app/repositories/meal_repository.dart';
import 'package:weight_tracking_app/util/date/max_min_date.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController extends BaseController<MealRepository>
    with Store, GoNavigator {
  final MealRepository _mealRepository;
  _HomeController(this._mealRepository) : super(_mealRepository);

  // final ObservableList<Meal> mealsAvailable = ObservableList.of([]);

  final ObservableList<Meal> mealsConsumed = ObservableList.of([]);

  @computed
  MealCategory? get recommendedMealCategory => mealAccordingNow();

  // @action
  // void addAllMeal(Iterable<Meal> meals) {
  //   mealsAvailable.addAll(meals);
  // }

  @action
  void addAllMealConsumed(Iterable<Meal> meals) {
    mealsConsumed.addAll(meals);
  }

  @override
  void init() {
    // _getMealsAvailable();
    _getMealsConsumedTillNow();
  }

  // Future<void> _getMealsAvailable() async {
  //   final result = await _mealRepository.queryAll();

  //   result.fold((error) {
  //     errorSnackbar("Something went wrong while fetching meals");
  //     go(Globals.rootNavigatorKey, Uri(path: Routes.root));
  //   }, (meals) {
  //     addAllMeal(meals);
  //   });
  // }

  Future<void> refreshMeals() async {
    _getMealsConsumedTillNow();
  }

  Future<void> _getMealsConsumedTillNow() async {
    final result = await _mealRepository.queryMealsConsumedByDate(
        // TODAY AT 00:00:00
        MaxMinDate.minDate(DateTime.now()),
        // NOW
        DateTime.now());

    result.fold((error) {
      errorSnackbar("Could not fetch meals consumed today");
      // go(Globals.rootNavigatorKey, Uri(path: RoutesNavigation.home));
    }, (meals) {
      addAllMealConsumed(meals);
    });
  }

  MealCategory? mealAccordingNow() {
    final now = DateTime.now();

    if (now.hour >= 6 && now.hour < 12) {
      return MealCategory.breakfast;
    } else if (now.hour >= 12 && now.hour < 18) {
      return MealCategory.lunch;
    } else if (now.hour >= 18 && now.hour < 24) {
      return MealCategory.dinner;
    } else {
      return null;
    }
  }
}
