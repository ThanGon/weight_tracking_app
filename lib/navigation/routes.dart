class Routes {
  static const String root = '/';

  static const String setup = "setup";

  static const String home = "home";

  static const String consumeMeal = "consumeMeal:mealCategory";
}

class RoutesNavigation {
  static const String setup = Routes.root + Routes.setup;

  static const String home = Routes.root + Routes.home;

  static const String consumeMeal =
      Routes.root + Routes.home + '/' + Routes.consumeMeal;

  static String consumeMealPath(String mealCategory) =>
      consumeMeal.replaceFirst("mealCategory", mealCategory);
}
