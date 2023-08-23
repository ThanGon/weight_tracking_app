import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weight_tracking_app/data/meal/meal_category.dart';
import 'package:weight_tracking_app/widgets/consume_meal_select_button.dart';

import '../../../../controllers/consume_meal/consume_meal_controller.dart';
import '../../../../core/globals.dart';

class ConsumeMealPage extends StatefulWidget {
  const ConsumeMealPage({super.key, required this.mealCategory});

  final MealCategory mealCategory;

  @override
  State<ConsumeMealPage> createState() => _ConsumeMealPageState();
}

class _ConsumeMealPageState extends State<ConsumeMealPage> {
  final controller = Globals.getIt.get<ConsumeMealController>();

  @override
  void initState() {
    controller.setMealCategoryToConsume(widget.mealCategory);

    controller.init();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //ROADMAP: MODAL FOR THE MEAL SELECTED
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TODO: USE INTL PACKAGE TO FORMAT DATE
            Text(
                "New meal reported for ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}"),
            Observer(
              builder: (context) => DropdownButton<MealCategory?>(
                  value: controller.mealCategoryToConsume,
                  items: MealCategory.values
                      .map((e) => DropdownMenuItem(
                          value: e, child: Text(e.displayName)))
                      .toList(),
                  onChanged: (mealCat) {
                    controller.setMealCategoryToConsume(mealCat);
                  }),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: Observer(
                builder: (context) => GridView.builder(
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemCount: controller.mealsAvailable.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  itemBuilder: (context, index) => Observer(
                    builder: (context) => ConsumeMealSelectButton(
                      onTap: () {
                        controller
                            .setMealSelected(controller.mealsAvailable[index]);
                      },
                      mealToConsumeName: controller.mealsAvailable[index].name,
                      toggle: controller.mealsAvailable[index].name ==
                          controller.mealSelected?.name,
                    ),
                  ),
                ),
              ),
            ),
            //TODO: CREATE CARD
            Observer(
                builder: (context) => TweenAnimationBuilder<double>(
                    tween: controller.mealSelected != null
                        ? Tween<double>(begin: 0, end: 1.0)
                        : Tween<double>(begin: 1, end: 0),
                    duration: const Duration(milliseconds: 1),
                    builder: (context, tween, child) => AnimatedOpacity(
                          opacity: tween,
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                              height: 300,
                              decoration:
                                  const BoxDecoration(color: Colors.red)),
                        )))
          ],
        )
      ],
    );
  }
}