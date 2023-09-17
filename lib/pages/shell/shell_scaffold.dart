import 'package:flutter/material.dart';

class ShellScaffold extends StatelessWidget {
  final Widget child;
  const ShellScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weight Tracker"),
      ),
      body: child,
    );
  }
}
