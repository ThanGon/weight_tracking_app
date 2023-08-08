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

  @override
  void dispose() {
    Globals.getIt.resetLazySingleton<HomeController>();

    super.dispose();
  }

  //TODO: MAKE A LIST FOR MEALS CONSUMED
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const PageScrollPhysics(),
      children: [
        const SizedBox(height: 200, child: Placeholder()),
        const Text(
            "How was your lunch?"), //TODO: IMPLEMENT DIFFERENT TEXT FOR DIFFERENT DAYS
        Observer(
          builder: (context) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  // REACTIVE STATE ONLY (NOT PERSISTING)
                  onTap: () => controller.mealsConsumed
                      .add(controller.mealsAvailable[index].consume()),
                  child: Card(
                    child: Text(controller.mealsAvailable[index].name),
                  ),
                );
              },
              itemCount: controller.mealsAvailable.length),
        ),
        const Text("Keep track of your meals"),
        Observer(
          builder: (context) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  child: Text(controller.mealsConsumed[index].name),
                );
              },
              itemCount: controller.mealsConsumed.length),
        ),
      ],
    );
  }
}
