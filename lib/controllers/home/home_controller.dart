import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/controllers/base/base_controller.dart';
import 'package:weight_tracking_app/core/globals.dart';
import 'package:weight_tracking_app/data/meal/meal.dart';
import 'package:weight_tracking_app/navigation/go_navigator.dart';
import 'package:weight_tracking_app/navigation/routes.dart';
import 'package:weight_tracking_app/repositories/meal_repository.dart';
import 'package:weight_tracking_app/repositories/user_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController extends BaseController<MealRepository>
    with Store, GoNavigator {
  final MealRepository _mealRepository;
  final UserRepository _userRepository;

  _HomeController(this._mealRepository, this._userRepository)
      : super(_mealRepository);

  final ObservableList<Meal> mealsAvailable = ObservableList.of([]);

  @action
  void addAllMeal(Iterable<Meal> meals) {
    mealsAvailable.addAll(meals);
  }

  @override
  void init() {
    _getMealsAvailable();
  }

  Future<void> _getMealsAvailable() async {
    final result = await _mealRepository.queryAll();

    result.fold((error) {
      errorSnackbar(error.message);
      go(Globals.rootNavigatorKey, Uri(path: RoutesNavigation.home));
    }, (meals) {
      addAllMeal(meals);
    });
  }
}
