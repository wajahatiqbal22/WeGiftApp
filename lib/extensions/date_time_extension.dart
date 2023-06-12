import 'dart:developer';

extension DateTimeExtension on DateTime {
  int get getDaysTillDate {
    // final date2 = DateTime.now();
    // final birthday = DateTime(date2.year, month, day);
    // int difference = daysBetween(birthday, date2);
    // if (birthday.month <= date2.month && birthday.day < date2.day) {
    //   difference = difference - 365;
    // }
    // log(difference.abs().toString());

    DateTime today = DateTime.now();
    DateTime next = DateTime(today.year, this.month, this.day);

    if (next.isBefore(today)) {
      next = next.add(const Duration(days: 365));
    }
    log((next.difference(today).inDays).toString());
    final days = next.difference(today).inDays + 1;
    if (days == 365) return 0;
    return days;

    // return difference.abs();
  }

  String getDateMonthAsString() {
    return "${this.day}-${this.month}";
  }
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inDays).round();
}
