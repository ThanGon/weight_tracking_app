import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weight_tracking_app/data/meal/meal_category.dart';
import 'package:weight_tracking_app/data/meal/meal_consumed.dart';
import 'package:weight_tracking_app/widgets/consume_meal_card/consume_meal_card.dart';
import 'package:weight_tracking_app/widgets/consume_meal_card/consume_meal_card_state.dart';
import 'package:weight_tracking_app/widgets/consume_meal_select_button.dart';
import 'package:weight_tracking_app/widgets/select_meal_category_chips.dart';

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
    controller.setMealCategoryToConsume(null);

    super.dispose();
  }

  //ROADMAP: CARD FOR THE MEAL SELECTED - IN PROGRESS
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ListView(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // USE CHIPS TO SELET DIFFERENT MEAL CATEGORY
              // Observer(
              //   builder: (context) => DropdownButton<MealCategory?>(
              //       value: controller.mealCategoryToConsume,
              //       items: MealCategory.values
              //           .map((e) => DropdownMenuItem(
              //               value: e, child: Text(e.displayName)))
              //           .toList(),
              //       onChanged: (mealCat) {
              //         controller.setMealCategoryToConsume(mealCat);
              //       }),
              // ),
              Observer(
                  builder: (context) => SelectMealCategoryChips(
                        selectedMealCategory: controller.mealCategoryToConsume,
                        onSelectChip: (category, selected) => {
                          if (selected)
                            {controller.setMealCategoryToConsume(category)}
                          else
                            {controller.setMealCategoryToConsume(null)}
                        },
                      )),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: Observer(
                  builder: (context) => GridView.builder(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    itemCount: controller.mealsAvailable.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    itemBuilder: (context, index) => Observer(
                      builder: (context) => ConsumeMealSelectButton(
                        onTap: () {
                          controller.setMealSelected(
                              controller.mealsAvailable[index]);
                        },
                        mealToConsumeName:
                            controller.mealsAvailable[index].name,
                        toggle: controller.mealsAvailable[index].name ==
                            controller.mealSelected?.name,
                      ),
                    ),
                  ),
                ),
              ),

              /// FIXME: MOVE ANIMATION TO CARD AND REFACTOR LOGIC
              /// MAYBE THROW STATE AS NULLABLE, WHEN NULL, CARD IS NOT VISIBLE (APPLYING ANIMATION LOGIC)
              const SizedBox(height: 10),
              Observer(
                  builder: (context) => TweenAnimationBuilder<double>(
                      tween: controller.mealSelected != null
                          ? Tween<double>(begin: 0, end: 1.0)
                          : Tween<double>(begin: 1, end: 0),
                      duration: const Duration(milliseconds: 1),
                      builder: (context, tween, child) => AnimatedOpacity(
                            opacity: tween,
                            duration: const Duration(milliseconds: 300),
                            child: Observer(
                              builder: (context) => Visibility(
                                visible: controller.mealSelected != null,
                                child: ConsumeMealCard(
                                    onSave: (state) {
                                      controller.mealSelected =
                                          MealConsumed.fromConsumeMealCardState(
                                              state);
                                      controller.consumeMeal();
                                    },
                                    state: ConsumeMealCardState.fromMeal(
                                        controller.mealSelected!)),
                              ),
                            ),
                          )))
            ],
          )
        ],
      ),
    );
  }
}
