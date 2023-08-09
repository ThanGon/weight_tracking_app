import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:weight_tracking_app/controllers/root/root_controller.dart';
import 'package:weight_tracking_app/core/globals.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final controller = Globals.getIt.get<RootController>();

  @override
  void initState() {
    controller.init();

    super.initState();
  }

  @override
  void dispose() {
    Globals.getIt.resetLazySingleton<RootController>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.defaultAssetBundle = DefaultAssetBundle.of(context);
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: TextButton(
          onPressed: () {
            Globals.getIt.get<Isar>().close(deleteFromDisk: true);
          },
          child: const Text("CLEAR DB [DEBUG]")),
    );
  }
}
