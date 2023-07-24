import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weight_tracking_app/pages/root/root_page.dart';

import 'routes.dart';

final rootRouter = GoRouter(routes: [
  GoRoute(
      path: Routes.root,
      pageBuilder: (context, state) =>
          const MaterialPage(child: RootPage(), maintainState: false))
]);
