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
      height: 400,
      child: Column(children: [
        // SizedBox(
        //   width: MediaQuery.sizeOf(context).width,
        //   height: 100,
        //   child:
        //       FittedBox(fit: BoxFit.fill, child: Image.network(state.imageURI)),
        // ),
        Image.network(
          state.imageURI,
          fit: BoxFit.cover,
          height: 160,
          width: MediaQuery.of(context).size.width,
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
            ],
          ),
        )
      ]),
    );
  }
}
