import 'package:flutter/material.dart';

import 'consume_meal_card_state.dart';

class ConsumeMealCard extends StatelessWidget {
  const ConsumeMealCard({required this.state, super.key});

  final ConsumeMealCardState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 4),
        borderRadius: BorderRadius.circular(5),
      ),
      // padding: EdgeInsets.symmetric(horizontal: ),
      // height: 400,
      child: Column(children: [
        Image.network(
          state.imageURI,
          fit: BoxFit.cover,
          height: 160,
          // width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
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
              )
            ],
          ),
        ),
        // ListView.builder(
        //   // itemCount: state.ingredients.length,
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   itemCount: 20,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text((index++).toString()),
        //       subtitle: Text((index++).toString()),
        //     );
        //   },
        // ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.ingredients.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.ingredients[index].name),
              subtitle: Text(state.ingredients[index].calories.toString()),
            );
          },
        ),
        const SizedBox(height: 10),
        // WRITE ME A ROUNDED TEXT BUTTON TO SAVE THE MEAL
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text("Save"),
            ),
          ],
        )
      ]),
    );
  }
}
