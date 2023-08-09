import 'package:flutter/material.dart';

class MealCategoryActionButton extends StatelessWidget {
  const MealCategoryActionButton({
    super.key,
    required this.icon,
    required this.mealCategory,
    required this.onTap,
    this.toggle = false,
  });

  final String mealCategory;
  final IconData icon;
  final bool toggle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: toggle
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 70,
        width: 80,
        // alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon), Text(mealCategory)],
        ),
      ),
    );
  }
}
