import 'package:flutter/material.dart';

class CalTrackerTheme {
  static ThemeData buildTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(centerTitle: true),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      useMaterial3: true,
    );
  }
}
