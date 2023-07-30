import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weight_tracking_app/pages/home/home_page.dart';
import 'package:weight_tracking_app/pages/root/root_page.dart';
import 'package:weight_tracking_app/pages/setup/setup_page.dart';

import 'routes.dart';

final rootRouter = GoRouter(initialLocation: Routes.root, routes: [
  GoRoute(
      path: Routes.root,
      pageBuilder: (context, state) =>
          const MaterialPage(child: RootPage(), maintainState: false)),
  GoRoute(
      path: RoutesNavigation.setup,
      pageBuilder: (context, state) =>
          const MaterialPage(child: SetupPage(), maintainState: false)),
  GoRoute(
    path: RoutesNavigation.home,
    pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
  )
]);
