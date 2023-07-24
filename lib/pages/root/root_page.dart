import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/globals.dart';
import 'package:weight_tracking_app/navigation/go_navigator.dart';
import 'package:weight_tracking_app/navigation/routes.dart';
import 'package:weight_tracking_app/pages/root/root_controller.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with GoNavigator {
  final controller = getIt.get<RootController>();

  @override
  void initState() {
    controller.init();

    super.initState();
  }

  @override
  void dispose() {
    getIt.resetLazySingleton<RootController>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(
      builder: (context) {
        if (controller.mustCreateUser) {
          go(context, Uri(path: RoutesNavigation.setup));
          //TODO: IMPLEMENT SETUP PAGE
        }
        if (controller.mainUser != null) {
          //TODO: IMPLEMENT HOME PAGE
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
