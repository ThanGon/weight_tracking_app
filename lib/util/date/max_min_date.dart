/// UTILITY FOR DEFINING THE MAX (MAXIMUM UPPER BOUND) AND MIN (MINIMUM LOWER BOUND) DATES FOR A GIVEN DATE
class MaxMinDate {
  /// THE MAXIMUM DATE FOR A GIVEN DATE
  static DateTime maxDate(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999, 999);
  }

  /// THE MINIMUM DATE FOR A GIVEN DATE
  static DateTime minDate(DateTime date) {
    return DateTime(date.year, date.month, date.day, 0, 0, 0, 0, 0);
  }
}
