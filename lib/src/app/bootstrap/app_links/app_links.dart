// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_links.freezed.dart';
part 'app_links.g.dart';

@freezed
abstract class AppLinks implements _$AppLinks {
  const AppLinks._();
  @JsonSerializable(explicitToJson: true)
  factory AppLinks({
    required Category category,
    required SubCategory subCategory,
    required String id,
    required String name,
    required String pictureUrl,
    required String link,
  }) = _AppLinks;

  factory AppLinks.fromJson(Map<String, dynamic> json) =>
      _$AppLinksFromJson(json);
}

enum Category { popular, card, gift, stores, giftCards }

enum SubCategory {
  popular,
  popular_birthday,
  funny_birthday,
  christmas,
  valentines_day,
  mothers_day,
  fathers_day,
  for_her,
  for_him,
  for_kids,
  pet
}
