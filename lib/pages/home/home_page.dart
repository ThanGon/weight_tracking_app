import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weight_tracking_app/controllers/home/home_controller.dart';
import 'package:weight_tracking_app/core/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Globals.getIt.get<HomeController>();

  @override
  void initState() {
    controller.init();

    super.initState();
  }

  //TODO: MAKE A LIST FOR MEALS CONSUMED
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 200, child: Placeholder()),
        const Text(
            "How was your lunch?"), //TODO: IMPLEMENT DIFFERENT TEXT FOR DIFFERENT DAYS
        Observer(
          builder: (context) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  child: Text(controller.mealsAvailable[index].name),
                );
              },
              itemCount: controller.mealsAvailable.length),
        )
      ],
    );
  }
}
