import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

abstract interface class GoNavigatorInterface {
  void go(BuildContext context, Uri target);
}

mixin GoNavigator implements GoNavigatorInterface {
  @override
  void go(BuildContext context, Uri target) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      GoRouter.of(context).go(target.toString());
    });
  }
}
