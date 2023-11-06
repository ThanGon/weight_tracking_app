import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Text(title, style: const TextStyle(fontSize: 18)),
        ),
      )
    ]);
  }
}
