import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeTimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const DateTimeTimestampConverter();

  @override
  DateTime fromJson(Timestamp stamp) {
    return stamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) {
    return Timestamp.fromDate(date);
  }
}

class DateTimeOptionTimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const DateTimeOptionTimestampConverter();
  @override
  DateTime? fromJson(Timestamp? stamp) {
    return stamp?.toDate();
  }

  @override
  Timestamp? toJson(DateTime? date) {
    if (date == null) return null;

    return Timestamp.fromDate(date);
  }
}
