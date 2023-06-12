// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'we_gift_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeGiftUser _$WeGiftUserFromJson(Map<String, dynamic> json) {
  return _WeGiftUser.fromJson(json);
}

/// @nodoc
mixin _$WeGiftUser {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  UserDetails? get userDetails => throw _privateConstructorUsedError;
  Map<String, Wishlist> get wishlist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeGiftUserCopyWith<WeGiftUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeGiftUserCopyWith<$Res> {
  factory $WeGiftUserCopyWith(
          WeGiftUser value, $Res Function(WeGiftUser) then) =
      _$WeGiftUserCopyWithImpl<$Res, WeGiftUser>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? fcmToken,
      String email,
      String uid,
      String? phoneNumber,
      String? username,
      UserDetails? userDetails,
      Map<String, Wishlist> wishlist});

  $UserDetailsCopyWith<$Res>? get userDetails;
}

/// @nodoc
class _$WeGiftUserCopyWithImpl<$Res, $Val extends WeGiftUser>
    implements $WeGiftUserCopyWith<$Res> {
  _$WeGiftUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? fcmToken = freezed,
    Object? email = null,
    Object? uid = null,
    Object? phoneNumber = freezed,
    Object? username = freezed,
    Object? userDetails = freezed,
    Object? wishlist = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails?,
      wishlist: null == wishlist
          ? _value.wishlist
          : wishlist // ignore: cast_nullable_to_non_nullable
              as Map<String, Wishlist>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDetailsCopyWith<$Res>? get userDetails {
    if (_value.userDetails == null) {
      return null;
    }

    return $UserDetailsCopyWith<$Res>(_value.userDetails!, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeGiftUserCopyWith<$Res>
    implements $WeGiftUserCopyWith<$Res> {
  factory _$$_WeGiftUserCopyWith(
          _$_WeGiftUser value, $Res Function(_$_WeGiftUser) then) =
      __$$_WeGiftUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? fcmToken,
      String email,
      String uid,
      String? phoneNumber,
      String? username,
      UserDetails? userDetails,
      Map<String, Wishlist> wishlist});

  @override
  $UserDetailsCopyWith<$Res>? get userDetails;
}

/// @nodoc
class __$$_WeGiftUserCopyWithImpl<$Res>
    extends _$WeGiftUserCopyWithImpl<$Res, _$_WeGiftUser>
    implements _$$_WeGiftUserCopyWith<$Res> {
  __$$_WeGiftUserCopyWithImpl(
      _$_WeGiftUser _value, $Res Function(_$_WeGiftUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? fcmToken = freezed,
    Object? email = null,
    Object? uid = null,
    Object? phoneNumber = freezed,
    Object? username = freezed,
    Object? userDetails = freezed,
    Object? wishlist = null,
  }) {
    return _then(_$_WeGiftUser(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails?,
      wishlist: null == wishlist
          ? _value._wishlist
          : wishlist // ignore: cast_nullable_to_non_nullable
              as Map<String, Wishlist>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_WeGiftUser extends _WeGiftUser {
  const _$_WeGiftUser(
      {required this.firstName,
      required this.lastName,
      this.fcmToken,
      required this.email,
      required this.uid,
      this.phoneNumber,
      this.username,
      this.userDetails,
      final Map<String, Wishlist> wishlist = const {}})
      : _wishlist = wishlist,
        super._();

  factory _$_WeGiftUser.fromJson(Map<String, dynamic> json) =>
      _$$_WeGiftUserFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? fcmToken;
  @override
  final String email;
  @override
  final String uid;
  @override
  final String? phoneNumber;
  @override
  final String? username;
  @override
  final UserDetails? userDetails;
  final Map<String, Wishlist> _wishlist;
  @override
  @JsonKey()
  Map<String, Wishlist> get wishlist {
    if (_wishlist is EqualUnmodifiableMapView) return _wishlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_wishlist);
  }

  @override
  String toString() {
    return 'WeGiftUser(firstName: $firstName, lastName: $lastName, fcmToken: $fcmToken, email: $email, uid: $uid, phoneNumber: $phoneNumber, username: $username, userDetails: $userDetails, wishlist: $wishlist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeGiftUser &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            const DeepCollectionEquality().equals(other._wishlist, _wishlist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      fcmToken,
      email,
      uid,
      phoneNumber,
      username,
      userDetails,
      const DeepCollectionEquality().hash(_wishlist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeGiftUserCopyWith<_$_WeGiftUser> get copyWith =>
      __$$_WeGiftUserCopyWithImpl<_$_WeGiftUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeGiftUserToJson(
      this,
    );
  }
}

abstract class _WeGiftUser extends WeGiftUser {
  const factory _WeGiftUser(
      {required final String firstName,
      required final String lastName,
      final String? fcmToken,
      required final String email,
      required final String uid,
      final String? phoneNumber,
      final String? username,
      final UserDetails? userDetails,
      final Map<String, Wishlist> wishlist}) = _$_WeGiftUser;
  const _WeGiftUser._() : super._();

  factory _WeGiftUser.fromJson(Map<String, dynamic> json) =
      _$_WeGiftUser.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get fcmToken;
  @override
  String get email;
  @override
  String get uid;
  @override
  String? get phoneNumber;
  @override
  String? get username;
  @override
  UserDetails? get userDetails;
  @override
  Map<String, Wishlist> get wishlist;
  @override
  @JsonKey(ignore: true)
  _$$_WeGiftUserCopyWith<_$_WeGiftUser> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return _UserDetails.fromJson(json);
}

/// @nodoc
mixin _$UserDetails {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get dobAsString => throw _privateConstructorUsedError;
  String? get aniversaryAsString => throw _privateConstructorUsedError;
  @DateTimeOptionTimestampConverter()
  DateTime? get birthday => throw _privateConstructorUsedError;
  @DateTimeOptionTimestampConverter()
  DateTime? get anniversary => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  Map<NotificationTypes, bool> get optionalEvents =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDetailsCopyWith<UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsCopyWith<$Res> {
  factory $UserDetailsCopyWith(
          UserDetails value, $Res Function(UserDetails) then) =
      _$UserDetailsCopyWithImpl<$Res, UserDetails>;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      String? dobAsString,
      String? aniversaryAsString,
      @DateTimeOptionTimestampConverter() DateTime? birthday,
      @DateTimeOptionTimestampConverter() DateTime? anniversary,
      String? photoUrl,
      Map<NotificationTypes, bool> optionalEvents});
}

/// @nodoc
class _$UserDetailsCopyWithImpl<$Res, $Val extends UserDetails>
    implements $UserDetailsCopyWith<$Res> {
  _$UserDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? dobAsString = freezed,
    Object? aniversaryAsString = freezed,
    Object? birthday = freezed,
    Object? anniversary = freezed,
    Object? photoUrl = freezed,
    Object? optionalEvents = null,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dobAsString: freezed == dobAsString
          ? _value.dobAsString
          : dobAsString // ignore: cast_nullable_to_non_nullable
              as String?,
      aniversaryAsString: freezed == aniversaryAsString
          ? _value.aniversaryAsString
          : aniversaryAsString // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      anniversary: freezed == anniversary
          ? _value.anniversary
          : anniversary // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      optionalEvents: null == optionalEvents
          ? _value.optionalEvents
          : optionalEvents // ignore: cast_nullable_to_non_nullable
              as Map<NotificationTypes, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDetailsCopyWith<$Res>
    implements $UserDetailsCopyWith<$Res> {
  factory _$$_UserDetailsCopyWith(
          _$_UserDetails value, $Res Function(_$_UserDetails) then) =
      __$$_UserDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      String? dobAsString,
      String? aniversaryAsString,
      @DateTimeOptionTimestampConverter() DateTime? birthday,
      @DateTimeOptionTimestampConverter() DateTime? anniversary,
      String? photoUrl,
      Map<NotificationTypes, bool> optionalEvents});
}

/// @nodoc
class __$$_UserDetailsCopyWithImpl<$Res>
    extends _$UserDetailsCopyWithImpl<$Res, _$_UserDetails>
    implements _$$_UserDetailsCopyWith<$Res> {
  __$$_UserDetailsCopyWithImpl(
      _$_UserDetails _value, $Res Function(_$_UserDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? dobAsString = freezed,
    Object? aniversaryAsString = freezed,
    Object? birthday = freezed,
    Object? anniversary = freezed,
    Object? photoUrl = freezed,
    Object? optionalEvents = null,
  }) {
    return _then(_$_UserDetails(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dobAsString: freezed == dobAsString
          ? _value.dobAsString
          : dobAsString // ignore: cast_nullable_to_non_nullable
              as String?,
      aniversaryAsString: freezed == aniversaryAsString
          ? _value.aniversaryAsString
          : aniversaryAsString // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      anniversary: freezed == anniversary
          ? _value.anniversary
          : anniversary // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      optionalEvents: null == optionalEvents
          ? _value._optionalEvents
          : optionalEvents // ignore: cast_nullable_to_non_nullable
              as Map<NotificationTypes, bool>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserDetails extends _UserDetails {
  const _$_UserDetails(
      {this.firstName,
      this.lastName,
      this.email,
      this.dobAsString,
      this.aniversaryAsString,
      @DateTimeOptionTimestampConverter() this.birthday,
      @DateTimeOptionTimestampConverter() this.anniversary,
      this.photoUrl,
      final Map<NotificationTypes, bool> optionalEvents = const {
        NotificationTypes.fathersDay: false,
        NotificationTypes.mothersDay: false,
        NotificationTypes.valentines: false
      }})
      : _optionalEvents = optionalEvents,
        super._();

  factory _$_UserDetails.fromJson(Map<String, dynamic> json) =>
      _$$_UserDetailsFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? dobAsString;
  @override
  final String? aniversaryAsString;
  @override
  @DateTimeOptionTimestampConverter()
  final DateTime? birthday;
  @override
  @DateTimeOptionTimestampConverter()
  final DateTime? anniversary;
  @override
  final String? photoUrl;
  final Map<NotificationTypes, bool> _optionalEvents;
  @override
  @JsonKey()
  Map<NotificationTypes, bool> get optionalEvents {
    if (_optionalEvents is EqualUnmodifiableMapView) return _optionalEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_optionalEvents);
  }

  @override
  String toString() {
    return 'UserDetails(firstName: $firstName, lastName: $lastName, email: $email, dobAsString: $dobAsString, aniversaryAsString: $aniversaryAsString, birthday: $birthday, anniversary: $anniversary, photoUrl: $photoUrl, optionalEvents: $optionalEvents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDetails &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dobAsString, dobAsString) ||
                other.dobAsString == dobAsString) &&
            (identical(other.aniversaryAsString, aniversaryAsString) ||
                other.aniversaryAsString == aniversaryAsString) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.anniversary, anniversary) ||
                other.anniversary == anniversary) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            const DeepCollectionEquality()
                .equals(other._optionalEvents, _optionalEvents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      dobAsString,
      aniversaryAsString,
      birthday,
      anniversary,
      photoUrl,
      const DeepCollectionEquality().hash(_optionalEvents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDetailsCopyWith<_$_UserDetails> get copyWith =>
      __$$_UserDetailsCopyWithImpl<_$_UserDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDetailsToJson(
      this,
    );
  }
}

abstract class _UserDetails extends UserDetails {
  const factory _UserDetails(
      {final String? firstName,
      final String? lastName,
      final String? email,
      final String? dobAsString,
      final String? aniversaryAsString,
      @DateTimeOptionTimestampConverter() final DateTime? birthday,
      @DateTimeOptionTimestampConverter() final DateTime? anniversary,
      final String? photoUrl,
      final Map<NotificationTypes, bool> optionalEvents}) = _$_UserDetails;
  const _UserDetails._() : super._();

  factory _UserDetails.fromJson(Map<String, dynamic> json) =
      _$_UserDetails.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String? get dobAsString;
  @override
  String? get aniversaryAsString;
  @override
  @DateTimeOptionTimestampConverter()
  DateTime? get birthday;
  @override
  @DateTimeOptionTimestampConverter()
  DateTime? get anniversary;
  @override
  String? get photoUrl;
  @override
  Map<NotificationTypes, bool> get optionalEvents;
  @override
  @JsonKey(ignore: true)
  _$$_UserDetailsCopyWith<_$_UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

Wishlist _$WishlistFromJson(Map<String, dynamic> json) {
  return _Wishlist.fromJson(json);
}

/// @nodoc
mixin _$Wishlist {
  String get link => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  bool get isReserved => throw _privateConstructorUsedError;
  String? get reservedBy => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<String>? get productImage => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WishlistCopyWith<Wishlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistCopyWith<$Res> {
  factory $WishlistCopyWith(Wishlist value, $Res Function(Wishlist) then) =
      _$WishlistCopyWithImpl<$Res, Wishlist>;
  @useResult
  $Res call(
      {String link,
      String id,
      bool isReserved,
      String? reservedBy,
      String? price,
      int quantity,
      String? title,
      List<String>? productImage,
      String? details});
}

/// @nodoc
class _$WishlistCopyWithImpl<$Res, $Val extends Wishlist>
    implements $WishlistCopyWith<$Res> {
  _$WishlistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? id = null,
    Object? isReserved = null,
    Object? reservedBy = freezed,
    Object? price = freezed,
    Object? quantity = null,
    Object? title = freezed,
    Object? productImage = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isReserved: null == isReserved
          ? _value.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool,
      reservedBy: freezed == reservedBy
          ? _value.reservedBy
          : reservedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      productImage: freezed == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WishlistCopyWith<$Res> implements $WishlistCopyWith<$Res> {
  factory _$$_WishlistCopyWith(
          _$_Wishlist value, $Res Function(_$_Wishlist) then) =
      __$$_WishlistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String link,
      String id,
      bool isReserved,
      String? reservedBy,
      String? price,
      int quantity,
      String? title,
      List<String>? productImage,
      String? details});
}

/// @nodoc
class __$$_WishlistCopyWithImpl<$Res>
    extends _$WishlistCopyWithImpl<$Res, _$_Wishlist>
    implements _$$_WishlistCopyWith<$Res> {
  __$$_WishlistCopyWithImpl(
      _$_Wishlist _value, $Res Function(_$_Wishlist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? id = null,
    Object? isReserved = null,
    Object? reservedBy = freezed,
    Object? price = freezed,
    Object? quantity = null,
    Object? title = freezed,
    Object? productImage = freezed,
    Object? details = freezed,
  }) {
    return _then(_$_Wishlist(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isReserved: null == isReserved
          ? _value.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool,
      reservedBy: freezed == reservedBy
          ? _value.reservedBy
          : reservedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      productImage: freezed == productImage
          ? _value._productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Wishlist extends _Wishlist {
  const _$_Wishlist(
      {required this.link,
      required this.id,
      this.isReserved = false,
      this.reservedBy,
      this.price,
      this.quantity = 1,
      this.title,
      final List<String>? productImage,
      this.details})
      : _productImage = productImage,
        super._();

  factory _$_Wishlist.fromJson(Map<String, dynamic> json) =>
      _$$_WishlistFromJson(json);

  @override
  final String link;
  @override
  final String id;
  @override
  @JsonKey()
  final bool isReserved;
  @override
  final String? reservedBy;
  @override
  final String? price;
  @override
  @JsonKey()
  final int quantity;
  @override
  final String? title;
  final List<String>? _productImage;
  @override
  List<String>? get productImage {
    final value = _productImage;
    if (value == null) return null;
    if (_productImage is EqualUnmodifiableListView) return _productImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? details;

  @override
  String toString() {
    return 'Wishlist(link: $link, id: $id, isReserved: $isReserved, reservedBy: $reservedBy, price: $price, quantity: $quantity, title: $title, productImage: $productImage, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Wishlist &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isReserved, isReserved) ||
                other.isReserved == isReserved) &&
            (identical(other.reservedBy, reservedBy) ||
                other.reservedBy == reservedBy) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._productImage, _productImage) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      link,
      id,
      isReserved,
      reservedBy,
      price,
      quantity,
      title,
      const DeepCollectionEquality().hash(_productImage),
      details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WishlistCopyWith<_$_Wishlist> get copyWith =>
      __$$_WishlistCopyWithImpl<_$_Wishlist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WishlistToJson(
      this,
    );
  }
}

abstract class _Wishlist extends Wishlist {
  const factory _Wishlist(
      {required final String link,
      required final String id,
      final bool isReserved,
      final String? reservedBy,
      final String? price,
      final int quantity,
      final String? title,
      final List<String>? productImage,
      final String? details}) = _$_Wishlist;
  const _Wishlist._() : super._();

  factory _Wishlist.fromJson(Map<String, dynamic> json) = _$_Wishlist.fromJson;

  @override
  String get link;
  @override
  String get id;
  @override
  bool get isReserved;
  @override
  String? get reservedBy;
  @override
  String? get price;
  @override
  int get quantity;
  @override
  String? get title;
  @override
  List<String>? get productImage;
  @override
  String? get details;
  @override
  @JsonKey(ignore: true)
  _$$_WishlistCopyWith<_$_Wishlist> get copyWith =>
      throw _privateConstructorUsedError;
}
