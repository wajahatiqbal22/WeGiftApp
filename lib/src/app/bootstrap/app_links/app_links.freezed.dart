// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_links.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppLinks _$AppLinksFromJson(Map<String, dynamic> json) {
  return _AppLinks.fromJson(json);
}

/// @nodoc
mixin _$AppLinks {
  Category get category => throw _privateConstructorUsedError;
  SubCategory get subCategory => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get pictureUrl => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppLinksCopyWith<AppLinks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLinksCopyWith<$Res> {
  factory $AppLinksCopyWith(AppLinks value, $Res Function(AppLinks) then) =
      _$AppLinksCopyWithImpl<$Res, AppLinks>;
  @useResult
  $Res call(
      {Category category,
      SubCategory subCategory,
      String id,
      String name,
      String pictureUrl,
      String link});
}

/// @nodoc
class _$AppLinksCopyWithImpl<$Res, $Val extends AppLinks>
    implements $AppLinksCopyWith<$Res> {
  _$AppLinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? subCategory = null,
    Object? id = null,
    Object? name = null,
    Object? pictureUrl = null,
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as SubCategory,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppLinksCopyWith<$Res> implements $AppLinksCopyWith<$Res> {
  factory _$$_AppLinksCopyWith(
          _$_AppLinks value, $Res Function(_$_AppLinks) then) =
      __$$_AppLinksCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Category category,
      SubCategory subCategory,
      String id,
      String name,
      String pictureUrl,
      String link});
}

/// @nodoc
class __$$_AppLinksCopyWithImpl<$Res>
    extends _$AppLinksCopyWithImpl<$Res, _$_AppLinks>
    implements _$$_AppLinksCopyWith<$Res> {
  __$$_AppLinksCopyWithImpl(
      _$_AppLinks _value, $Res Function(_$_AppLinks) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? subCategory = null,
    Object? id = null,
    Object? name = null,
    Object? pictureUrl = null,
    Object? link = null,
  }) {
    return _then(_$_AppLinks(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as SubCategory,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AppLinks extends _AppLinks {
  _$_AppLinks(
      {required this.category,
      required this.subCategory,
      required this.id,
      required this.name,
      required this.pictureUrl,
      required this.link})
      : super._();

  factory _$_AppLinks.fromJson(Map<String, dynamic> json) =>
      _$$_AppLinksFromJson(json);

  @override
  final Category category;
  @override
  final SubCategory subCategory;
  @override
  final String id;
  @override
  final String name;
  @override
  final String pictureUrl;
  @override
  final String link;

  @override
  String toString() {
    return 'AppLinks(category: $category, subCategory: $subCategory, id: $id, name: $name, pictureUrl: $pictureUrl, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppLinks &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, subCategory, id, name, pictureUrl, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppLinksCopyWith<_$_AppLinks> get copyWith =>
      __$$_AppLinksCopyWithImpl<_$_AppLinks>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppLinksToJson(
      this,
    );
  }
}

abstract class _AppLinks extends AppLinks {
  factory _AppLinks(
      {required final Category category,
      required final SubCategory subCategory,
      required final String id,
      required final String name,
      required final String pictureUrl,
      required final String link}) = _$_AppLinks;
  _AppLinks._() : super._();

  factory _AppLinks.fromJson(Map<String, dynamic> json) = _$_AppLinks.fromJson;

  @override
  Category get category;
  @override
  SubCategory get subCategory;
  @override
  String get id;
  @override
  String get name;
  @override
  String get pictureUrl;
  @override
  String get link;
  @override
  @JsonKey(ignore: true)
  _$$_AppLinksCopyWith<_$_AppLinks> get copyWith =>
      throw _privateConstructorUsedError;
}
