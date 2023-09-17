import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weight_tracking_app/core/globals.dart';
import 'package:weight_tracking_app/data/meal/meal_category.dart';
import 'package:weight_tracking_app/pages/root/root_page.dart';
import 'package:weight_tracking_app/pages/setup/setup_page.dart';
import 'package:weight_tracking_app/pages/shell/home/consume_meal/consume_meal_page.dart';
import 'package:weight_tracking_app/pages/shell/home/home_page.dart';
import 'package:weight_tracking_app/pages/shell/shell_scaffold.dart';

import 'routes.dart';

//TODO: SWITCH MATERIAL PAGES TO CUSTOM TRANSITION PAGES (GO ROUTER)
// BUILD CUSTOM TRANSITIONS AS WELL

final rootRouter = GoRouter(
    navigatorKey: Globals.rootNavigatorKey,
    initialLocation: Routes.root,
    routes: [
      GoRoute(
          path: Routes.root,
          pageBuilder: (context, state) =>
              const MaterialPage(child: RootPage(), maintainState: false)),
      GoRoute(
          path: RoutesNavigation.setup,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SetupPage(), maintainState: false)),
      ShellRoute(
          navigatorKey: Globals.shellNavigatorKey,
          pageBuilder: (context, state, child) =>
              MaterialPage(child: ShellScaffold(child: child)),
          routes: [
            GoRoute(
                path: RoutesNavigation.home,
                builder: (context, state) => const HomePage(),
                routes: [
                  GoRoute(
                      path: Routes.consumeMeal,
                      builder: (context, state) {
                        return ConsumeMealPage(
                            mealCategory: MealCategory.values.byName(
                                state.uri.queryParameters["mealCategory"]!));
                      })
                ]),
          ])
    ]);
