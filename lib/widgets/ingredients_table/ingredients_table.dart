import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/widgets/consume_meal_card/ingredient_meal_card_state.dart';

class IngredientsTable extends StatelessWidget {
  const IngredientsTable(
      {required this.ingredients, this.rowHeight = 8, super.key});

  final ObservableList<IngredientMealCardState> ingredients;

  final double rowHeight;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Table(
        children: ingredientsRowBuilder(ingredients),
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FixedColumnWidth(16),
          2: FlexColumnWidth(1)
        },
      ),
    );
  }

  List<TableRow> ingredientsRowBuilder(
      ObservableList<IngredientMealCardState> ingredients) {
    final rows = <TableRow>[];
    for (var i = 0; i < ingredients.length; i++) {
      rows.add(TableRow(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: rowHeight),
          child: TextFormField(
            controller: ingredients[i].name,
            decoration: const InputDecoration(
              label: Text("Name"),
            ),
          ),
        ),
        const SizedBox(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: rowHeight),
          child: TextFormField(
            controller: ingredients[i].calories,
            onChanged: (cal) {
              ingredients[i].onChangedCalories?.call();
            },
            decoration: const InputDecoration(
              label: Text("Calories"),
            ),
          ),
        ),
      ]));
    }

    rows.add(TableRow(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: rowHeight),
        child: TextFormField(
          decoration: const InputDecoration(
            label: Text("Name"),
          ),
          onTap: () {
            ingredients.add(IngredientMealCardState(
                name: TextEditingController(),
                calories: TextEditingController()));
          },
          autofocus: false,
        ),
      ),
      const SizedBox(),
      Padding(
        padding: EdgeInsets.symmetric(vertical: rowHeight),
        child: TextFormField(
          decoration: const InputDecoration(
            label: Text("Calories"),
          ),
        ),
      ),
    ]));

    return rows;
  }
}
