import 'package:flutter/material.dart';
import 'package:weight_tracking_app/core/globals.dart';
import 'package:weight_tracking_app/core/theme.dart';
import 'package:weight_tracking_app/data/injections/injections.dart';
import 'package:weight_tracking_app/navigation/router.dart';

void main() async {
  // REQUIRED BY ISAR
  WidgetsFlutterBinding.ensureInitialized();
  // BLOCKING FUNCTION
  await DependencyInjections.inject();

  runApp(const WeightTracker());
}

class WeightTracker extends StatelessWidget {
  const WeightTracker({super.key});

  //ROOT MATERIAL
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: Globals.scaffoldMessengerKey,
      title: 'Weight Tracker',
      theme: CalTrackerTheme.buildTheme(),
      routerConfig: rootRouter,
    );
  }
}
