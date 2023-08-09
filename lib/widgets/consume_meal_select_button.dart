import 'package:flutter/material.dart';

class ConsumeMealSelectButton extends StatefulWidget {
  const ConsumeMealSelectButton(
      {super.key,
      required this.onTap,
      required this.mealToConsumeName,
      this.toggle = false});

  final String mealToConsumeName;
  final bool toggle;
  final VoidCallback onTap;

  @override
  State<ConsumeMealSelectButton> createState() =>
      _ConsumeMealSelectButtonState();
}

class _ConsumeMealSelectButtonState extends State<ConsumeMealSelectButton> {
  late bool _toggle;

  @override
  void initState() {
    _toggle = widget.toggle;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _toggle = !_toggle;
        });
        widget.onTap;
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _toggle
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
          children: [
            const Icon(Icons.lunch_dining),
            Text(widget.mealToConsumeName)
          ],
        ),
      ),
    );
  }
}
