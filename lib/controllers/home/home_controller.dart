import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/controllers/base/base_controller.dart';
import 'package:weight_tracking_app/data/meal/meal.dart';
import 'package:weight_tracking_app/data/meal/meal_category.dart';
import 'package:weight_tracking_app/data/user/user.dart';
import 'package:weight_tracking_app/navigation/go_navigator.dart';
import 'package:weight_tracking_app/repositories/meal_repository.dart';
import 'package:weight_tracking_app/repositories/user_repository.dart';
import 'package:weight_tracking_app/util/date/max_min_date.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController extends BaseController<MealRepository>
    with Store, GoNavigator {
  final MealRepository _mealRepository;
  final UserRepository _userRepository;

  _HomeController(this._mealRepository, this._userRepository)
      : super(_mealRepository);

  final ObservableList<Meal> mealsConsumed = ObservableList.of([]);

  @observable
  User? profile;

  @action
  setProfile(User profile) => profile = profile;

  @computed
  MealCategory? get recommendedMealCategory => mealAccordingNow();

  @action
  void clearMealsConsumed() {
    mealsConsumed.clear();
  }

  @action
  void addAllMealConsumed(Iterable<Meal> meals) {
    mealsConsumed.addAll(meals);
  }

  @override
  void init() {
    _getMealsConsumedTillNow();
  }

  Future<void> refreshMeals() async {
    _getMealsConsumedTillNow();
  }

  Future<User> getCurrentProfile({int userId = 1}) async {
    final result = await _userRepository.queryById(userId);

    // FIXME: THIS WAS LAZY
    return result.fold((error) {
      errorSnackbar("Could not get current profile");
      throw Exception();
    }, (profile) {
      if (profile == null) {
        errorSnackbar("There is no profile saved");
        throw Exception();
      }
      return profile;
    });
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
      clearMealsConsumed();
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
