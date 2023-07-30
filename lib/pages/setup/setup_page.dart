import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/controllers/setup/setup_controller.dart';
import 'package:weight_tracking_app/globals.dart';
import 'package:weight_tracking_app/navigation/go_navigator.dart';
import 'package:weight_tracking_app/navigation/routes.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> with GoNavigator {
  final _controller = Globals.getIt.get<SetupController>();

  @override
  void initState() {
    _controller.init();

    super.initState();
  }

  @override
  void dispose() {
    Globals.getIt.resetLazySingleton<SetupController>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //FIXME
    reaction((_) => _controller.proceedToNextAction, (next) {
      if (next) {
        go(context, Uri(path: RoutesNavigation.home));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Weight Tracker")),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("Welcome! Please enter your name below to start"),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: _controller.nameController,
                decoration: const InputDecoration(label: Text("Name")),
              ),
            ),
            const Spacer()
          ],
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              child: const Text("Next"),
              onPressed: () {
                _controller.saveUser();
              },
            ))
      ]),
    );
  }
}
