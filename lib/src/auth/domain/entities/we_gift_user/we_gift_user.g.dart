// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'we_gift_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeGiftUser _$$_WeGiftUserFromJson(Map<String, dynamic> json) =>
    _$_WeGiftUser(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      fcmToken: json['fcmToken'] as String?,
      email: json['email'] as String,
      uid: json['uid'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      username: json['username'] as String?,
      userDetails: json['userDetails'] == null
          ? null
          : UserDetails.fromJson(json['userDetails'] as Map<String, dynamic>),
      wishlist: (json['wishlist'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Wishlist.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_WeGiftUserToJson(_$_WeGiftUser instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fcmToken': instance.fcmToken,
      'email': instance.email,
      'uid': instance.uid,
      'phoneNumber': instance.phoneNumber,
      'username': instance.username,
      'userDetails': instance.userDetails?.toJson(),
      'wishlist': instance.wishlist.map((k, e) => MapEntry(k, e.toJson())),
    };

_$_UserDetails _$$_UserDetailsFromJson(Map<String, dynamic> json) =>
    _$_UserDetails(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      dobAsString: json['dobAsString'] as String?,
      aniversaryAsString: json['aniversaryAsString'] as String?,
      birthday: const DateTimeOptionTimestampConverter()
          .fromJson(json['birthday'] as Timestamp?),
      anniversary: const DateTimeOptionTimestampConverter()
          .fromJson(json['anniversary'] as Timestamp?),
      photoUrl: json['photoUrl'] as String?,
      optionalEvents: (json['optionalEvents'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry($enumDecode(_$NotificationTypesEnumMap, k), e as bool),
          ) ??
          const {
            NotificationTypes.fathersDay: false,
            NotificationTypes.mothersDay: false,
            NotificationTypes.valentines: false
          },
    );

Map<String, dynamic> _$$_UserDetailsToJson(_$_UserDetails instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'dobAsString': instance.dobAsString,
      'aniversaryAsString': instance.aniversaryAsString,
      'birthday':
          const DateTimeOptionTimestampConverter().toJson(instance.birthday),
      'anniversary':
          const DateTimeOptionTimestampConverter().toJson(instance.anniversary),
      'photoUrl': instance.photoUrl,
      'optionalEvents': instance.optionalEvents
          .map((k, e) => MapEntry(_$NotificationTypesEnumMap[k]!, e)),
    };

const _$NotificationTypesEnumMap = {
  NotificationTypes.all: 'all',
  NotificationTypes.birthday: 'birthday',
  NotificationTypes.christmas: 'christmas',
  NotificationTypes.anniversary: 'anniversary',
  NotificationTypes.valentines: 'valentines',
  NotificationTypes.mothersDay: 'mothersDay',
  NotificationTypes.fathersDay: 'fathersDay',
  NotificationTypes.push: 'push',
  NotificationTypes.email: 'email',
  NotificationTypes.textMessage: 'textMessage',
};

_$_Wishlist _$$_WishlistFromJson(Map<String, dynamic> json) => _$_Wishlist(
      link: json['link'] as String,
      id: json['id'] as String,
      isReserved: json['isReserved'] as bool? ?? false,
      reservedBy: json['reservedBy'] as String?,
      price: json['price'] as String?,
      quantity: json['quantity'] as int? ?? 1,
      title: json['title'] as String?,
      productImage: (json['productImage'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      details: json['details'] as String?,
    );

Map<String, dynamic> _$$_WishlistToJson(_$_Wishlist instance) =>
    <String, dynamic>{
      'link': instance.link,
      'id': instance.id,
      'isReserved': instance.isReserved,
      'reservedBy': instance.reservedBy,
      'price': instance.price,
      'quantity': instance.quantity,
      'title': instance.title,
      'productImage': instance.productImage,
      'details': instance.details,
    };
