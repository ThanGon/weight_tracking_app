import 'package:weight_tracking_app/data/enums/display_enum.dart';

enum MealCategory implements DisplayEnum {
  breakfast("Breakfast"),
  lunch("Lunch"),
  dinner("Dinner"),
  snack("Snack");

  @override
  final String displayName;

  const MealCategory(this.displayName);
}
