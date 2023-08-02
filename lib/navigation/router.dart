import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weight_tracking_app/core/globals.dart';
import 'package:weight_tracking_app/pages/home/home_page.dart';
import 'package:weight_tracking_app/pages/root/root_page.dart';
import 'package:weight_tracking_app/pages/setup/setup_page.dart';
import 'package:weight_tracking_app/pages/shell_scaffold.dart';

import 'routes.dart';

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
                builder: (context, state) => const HomePage())
          ])
    ]);
