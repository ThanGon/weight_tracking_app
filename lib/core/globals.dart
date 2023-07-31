import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// STATIC CLASS FOR GLOBAL VARIABLES ACCESSED THROUGHOUT THE APP
class Globals {
  static final getIt = GetIt.instance;

// GLOBAL KEY FOR HANDLING SCAFFOLD MESSAGES (USED MOSTLY FOR SNACKBARS)
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final shellNavigatorKey = GlobalKey<NavigatorState>();
}
