import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../core/globals.dart';

class ShellScaffold extends StatelessWidget {
  final Widget child;
  const ShellScaffold({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          child: const Text("Weight Tracker"),
          onPressed: () {
            Globals.getIt.get<Isar>().close(deleteFromDisk: true);
          },
        ),
      ),
      body: child,
      // floatingActionButton: FloatingActionButton(
      //     child: const Text("Clear DB [DEBUG]"),
      //     onPressed: () {
      //       Globals.getIt.get<Isar>().close(deleteFromDisk: true);
      //     }),
    );
  }
}
