import 'package:flutter/material.dart';
import 'package:weight_tracking_app/data/injections/injections.dart';
import 'package:weight_tracking_app/navigation/router.dart';

void main() {
  DependencyInjections.injectRoot();

  runApp(const WeightTracker());
}

class WeightTracker extends StatelessWidget {
  const WeightTracker({super.key});

  //ROOT MATERIAL
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weight Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      routerConfig: rootRouter,
    );
  }
}
