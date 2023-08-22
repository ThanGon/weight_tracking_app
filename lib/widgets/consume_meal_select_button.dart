import 'package:flutter/material.dart';

class ConsumeMealSelectButton extends StatelessWidget {
  const ConsumeMealSelectButton(
      {super.key,
      required this.onTap,
      required this.mealToConsumeName,
      this.toggle = false});

  final String mealToConsumeName;
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
          children: [const Icon(Icons.lunch_dining), Text(mealToConsumeName)],
        ),
      ),
    );
  }
}
