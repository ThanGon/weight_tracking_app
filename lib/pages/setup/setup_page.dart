import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weight_tracking_app/controllers/setup/setup_controller.dart';
import 'package:weight_tracking_app/core/globals.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Observer(
                builder: (context) => Visibility(
                    visible: _controller.isLoading,
                    child: const CircularProgressIndicator())),
            TextButton(
              child: const Text("Next"),
              onPressed: () {
                _controller.saveUser();
              },
            ),
          ],
        )
      ]),
    );
  }
}
