import 'package:flutter/material.dart';
import 'package:weight_tracking_app/widgets/ingredients_table/ingriedients_table.dart';

import 'consume_meal_card_state.dart';

class ConsumeMealCard extends StatelessWidget {
  const ConsumeMealCard({required this.state, super.key, required this.onSave});

  final ConsumeMealCardState state;

  final void Function(ConsumeMealCardState) onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 0.2,
          )
        ],
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).cardColor,
      ),
      child: Column(children: [
        Image.network(
          state.imageURI,
          fit: BoxFit.cover,
          height: 160,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: state.mealNameController,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
              ),
              TextFormField(
                controller: state.caloriesController,
                decoration: const InputDecoration(
                  label: Text("Calories"),
                ),
              ),
              IngredientsTable(ingredients: state.ingredients)
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: () => onSave(state),
              child: const Text("Save"),
            ),
          ],
        )
      ]),
    );
  }
}
