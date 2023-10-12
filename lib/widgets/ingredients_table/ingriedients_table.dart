import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:weight_tracking_app/data/ingredients/ingredient.dart';

class IngredientsTable extends StatelessWidget {
  const IngredientsTable({required this.ingredients, super.key});

  final ObservableList<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Table(
        children: ingredientsRowBuilder(ingredients),
        columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(1)},
      ),
    );
  }

  static List<TableRow> ingredientsRowBuilder(
      ObservableList<Ingredient> ingredients) {
    final rows = <TableRow>[];
    for (var i = 0; i < ingredients.length; i++) {
      rows.add(TableRow(children: [
        TextFormField(
          controller: TextEditingController(text: ingredients[i].name),
          decoration: const InputDecoration(
            label: Text("Name"),
          ),
        ),
        TextFormField(
          controller:
              TextEditingController(text: ingredients[i].calories.toString()),
          decoration: const InputDecoration(
            label: Text("Calories"),
          ),
        ),
      ]));
    }

    rows.add(TableRow(children: [
      TextFormField(
        decoration: const InputDecoration(
          label: Text("Name"),
        ),
        onTap: () {
          ingredients.add(const Ingredient());
        },
        autofocus: false,
      ),
      TextFormField(
        decoration: const InputDecoration(
          label: Text("Calories"),
        ),
      ),
    ]));

    return rows;
  }
}
