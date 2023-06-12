// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wegift/common/converters/datetime_timestamp_converter.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';

part 'we_gift_user.freezed.dart';
part 'we_gift_user.g.dart';

@freezed
abstract class WeGiftUser implements _$WeGiftUser {
  const WeGiftUser._();

  @JsonSerializable(explicitToJson: true)
  const factory WeGiftUser({
    required String firstName,
    required String lastName,
    String? fcmToken,
    required String email,
    required String uid,
    String? phoneNumber,
    String? username,
    UserDetails? userDetails,
    @Default({}) Map<String, Wishlist> wishlist,
  }) = _WeGiftUser;

  factory WeGiftUser.fromJson(Map<String, dynamic> json) =>
      _$WeGiftUserFromJson(json);
}

@freezed
abstract class UserDetails implements _$UserDetails {
  const UserDetails._();

  @JsonSerializable(explicitToJson: true)
  const factory UserDetails({
    String? firstName,
    String? lastName,
    String? email,
    String? dobAsString,
    String? aniversaryAsString,
    @DateTimeOptionTimestampConverter()
        DateTime? birthday,
    @DateTimeOptionTimestampConverter()
        DateTime? anniversary,
    String? photoUrl,
    @Default({
      NotificationTypes.fathersDay: false,
      NotificationTypes.mothersDay: false,
      NotificationTypes.valentines: false
    })
        Map<NotificationTypes, bool> optionalEvents,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
}

@freezed
abstract class Wishlist implements _$Wishlist {
  const Wishlist._();

  @JsonSerializable(explicitToJson: true)
  const factory Wishlist({
    required String link,
    required String id,
    @Default(false) bool isReserved,
    String? reservedBy,
    String? price,
    @Default(1) int quantity,
    String? title,
    List<String>? productImage,
    String? details,
  }) = _Wishlist;

  factory Wishlist.fromJson(Map<String, dynamic> json) =>
      _$WishlistFromJson(json);
}
