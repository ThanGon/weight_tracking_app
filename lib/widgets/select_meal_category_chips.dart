import 'package:flutter/material.dart';
import 'package:weight_tracking_app/data/meal/meal_category.dart';

class SelectMealCategoryChips extends StatelessWidget {
  const SelectMealCategoryChips(
      {required this.selectedMealCategory,
      required this.onSelectChip,
      super.key});

  final MealCategory? selectedMealCategory;

  final Function(MealCategory category, bool selected) onSelectChip;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 50),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: MealCategory.values
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ChoiceChip(
                    label: Text(e.displayName),
                    selected: selectedMealCategory == e,
                    onSelected: (selected) {
                      onSelectChip(e, selected);
                    },
                  ),
                ))
            .toList(),
      ),
    );
  }
}
