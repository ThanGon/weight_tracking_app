import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

abstract interface class GoNavigatorInterface {
  void go(GlobalKey<NavigatorState> navigatorKey, Uri target);
  void push(GlobalKey<NavigatorState> navigatorKey, Uri target);
  void pushReplacement(GlobalKey<NavigatorState> navigatorKey, Uri target);
  void pop(GlobalKey<NavigatorState> navigatorKey, Uri target);
}

mixin GoNavigator implements GoNavigatorInterface {
  @override
  void go(GlobalKey<NavigatorState> navigatorKey, Uri target) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      navigatorKey.currentState!.context.go(target.toString());
    });
  }

  @override
  void push(GlobalKey<NavigatorState> navigatorKey, Uri target) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      navigatorKey.currentState!.context.push(target.toString());
    });
  }

  @override
  void pushReplacement(GlobalKey<NavigatorState> navigatorKey, Uri target) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      navigatorKey.currentState!.context.pushReplacement(target.toString());
    });
  }

  @override
  void pop(GlobalKey<NavigatorState> navigatorKey, Uri target) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      navigatorKey.currentState!.context.pop();
    });
  }
}
