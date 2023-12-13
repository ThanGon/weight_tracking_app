import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weight_tracking_app/controllers/home/home_controller.dart';
import 'package:weight_tracking_app/core/globals.dart';
import 'package:weight_tracking_app/navigation/go_navigator.dart';
import 'package:weight_tracking_app/navigation/routes.dart';
import 'package:weight_tracking_app/widgets/meal_category_action_button.dart';

import '../../../data/meal/meal_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with GoNavigator {
  final controller = Globals.getIt.get<HomeController>();
  final scrollController = ScrollController();

  @override
  void initState() {
    controller.init();

    super.initState();
  }

  @override
  void dispose() {
    Globals.getIt.resetLazySingleton<HomeController>();

    super.dispose();
  }

  //TODO: MAKE A LIST FOR MEALS CONSUMED
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.refreshMeals();
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          // const SizedBox(height: 200, child: Placeholder()),
          Text("Welcome,"),

          const Text(
              "Would you like to report your diet today?"), //TODO: IMPLEMENT DIFFERENT TEXT FOR DIFFERENT DAYS
          // Observer(
          //   builder: (context) => ListView.builder(
          //       shrinkWrap: true,
          //       physics: const NeverScrollableScrollPhysics(),
          //       itemBuilder: (context, index) {
          //         return InkWell(
          //           // REACTIVE STATE ONLY (NOT PERSISTING)
          //           onTap: () => controller.mealsConsumed
          //               .add(controller.mealsAvailable[index].consume()),
          //           child: Card(
          //             child: Text(controller.mealsAvailable[index].name),
          //           ),
          //         );
          //       },
          //       itemCount: controller.mealsAvailable.length),
          // ),
          Observer(
              builder: (context) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MealCategoryActionButton(
                          toggle: controller.recommendedMealCategory ==
                              MealCategory.breakfast,
                          onTap: () => push(
                              Globals.shellNavigatorKey,
                              Uri(
                                  path: RoutesNavigation.consumeMeal,
                                  queryParameters: {
                                    "mealCategory": MealCategory.breakfast.name
                                  })),
                          icon: Icons.egg_alt,
                          mealCategory: MealCategory.breakfast.displayName),
                      MealCategoryActionButton(
                        toggle: controller.recommendedMealCategory ==
                            MealCategory.lunch,
                        icon: Icons.restaurant,
                        mealCategory: MealCategory.lunch.displayName,
                        onTap: () => push(
                            Globals.shellNavigatorKey,
                            Uri(
                                path: RoutesNavigation.consumeMeal,
                                queryParameters: {
                                  "mealCategory": MealCategory.lunch.name
                                })),
                      ),
                      MealCategoryActionButton(
                          toggle: controller.recommendedMealCategory ==
                              MealCategory.dinner,
                          icon: Icons.dinner_dining,
                          mealCategory: MealCategory.dinner.displayName,
                          onTap: () => push(
                              Globals.shellNavigatorKey,
                              Uri(
                                  path: RoutesNavigation.consumeMeal,
                                  queryParameters: {
                                    "mealCategory": MealCategory.dinner.name
                                  }))),
                      MealCategoryActionButton(
                        toggle: controller.recommendedMealCategory ==
                            MealCategory.snack,
                        icon: Icons.coffee,
                        mealCategory: MealCategory.snack.displayName,
                        onTap: () => push(
                            Globals.shellNavigatorKey,
                            Uri(
                                path: RoutesNavigation.consumeMeal,
                                queryParameters: {
                                  "mealCategory": MealCategory.snack.name
                                })),
                      )
                    ],
                  )),
          const Text("Keep track of your meals"),
          Observer(
            builder: (context) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    child: Text(controller.mealsConsumed[index].name),
                  );
                },
                itemCount: controller.mealsConsumed.length),
          ),
        ],
      ),
    );
  }
}
