import 'package:flutter/material.dart';
import 'package:weight_tracking_app/controllers/root/root_controller.dart';
import 'package:weight_tracking_app/globals.dart';

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
    // return Scaffold(body: Observer(
    //   builder: (context) {
    //     if (controller.mustCreateUser) {
    //       go(Globals.rootNavigatorKey, Uri(path: RoutesNavigation.setup));
    //     }
    //     if (controller.mainUser != null) {
    //       go(Globals.rootNavigatorKey, Uri(path: RoutesNavigation.home));
    //       //TODO: IMPLEMENT HOME PAGE
    //     }
    //     return const Center(child: CircularProgressIndicator());
    //   },
    // ));
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
