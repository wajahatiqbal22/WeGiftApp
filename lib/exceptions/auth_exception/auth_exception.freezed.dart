// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthException {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) unknown,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message, String? code) invalidCode,
    required TResult Function(String? message, String? code) userNotFound,
    required TResult Function(String? message, String? code) banned,
    required TResult Function(String? message, String? code) userDisabled,
    required TResult Function(String? message, String? code)
        operationNotAllowed,
    required TResult Function(String? message, String? code)
        accountExistsWithDifferentCredentials,
    required TResult Function(String? message, String? code) docDoesNotExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? unknown,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message, String? code)? invalidCode,
    TResult? Function(String? message, String? code)? userNotFound,
    TResult? Function(String? message, String? code)? banned,
    TResult? Function(String? message, String? code)? userDisabled,
    TResult? Function(String? message, String? code)? operationNotAllowed,
    TResult? Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult? Function(String? message, String? code)? docDoesNotExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? unknown,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message, String? code)? invalidCode,
    TResult Function(String? message, String? code)? userNotFound,
    TResult Function(String? message, String? code)? banned,
    TResult Function(String? message, String? code)? userDisabled,
    TResult Function(String? message, String? code)? operationNotAllowed,
    TResult Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult Function(String? message, String? code)? docDoesNotExist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthExceptionUnathorized value) unknown,
    required TResult Function(_AuthExceptionUnknown value) unauthorized,
    required TResult Function(_AuthExceptionInvalidCode value) invalidCode,
    required TResult Function(_AuthExceptionUserNotFound value) userNotFound,
    required TResult Function(_AuthExceptionUserBanned value) banned,
    required TResult Function(_AuthExceptionUserDisabled value) userDisabled,
    required TResult Function(_AuthExceptionOperationNotAllowed value)
        operationNotAllowed,
    required TResult Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)
        accountExistsWithDifferentCredentials,
    required TResult Function(_AuthExceptionDocDoesNotExist value)
        docDoesNotExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthExceptionUnathorized value)? unknown,
    TResult? Function(_AuthExceptionUnknown value)? unauthorized,
    TResult? Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult? Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult? Function(_AuthExceptionUserBanned value)? banned,
    TResult? Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult? Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult? Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult? Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthExceptionUnathorized value)? unknown,
    TResult Function(_AuthExceptionUnknown value)? unauthorized,
    TResult Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult Function(_AuthExceptionUserBanned value)? banned,
    TResult Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult Function(_AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthExceptionCopyWith<AuthException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthExceptionCopyWith<$Res> {
  factory $AuthExceptionCopyWith(
          AuthException value, $Res Function(AuthException) then) =
      _$AuthExceptionCopyWithImpl<$Res, AuthException>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$AuthExceptionCopyWithImpl<$Res, $Val extends AuthException>
    implements $AuthExceptionCopyWith<$Res> {
  _$AuthExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthExceptionUnathorizedCopyWith<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  factory _$$_AuthExceptionUnathorizedCopyWith(
          _$_AuthExceptionUnathorized value,
          $Res Function(_$_AuthExceptionUnathorized) then) =
      __$$_AuthExceptionUnathorizedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$_AuthExceptionUnathorizedCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$_AuthExceptionUnathorized>
    implements _$$_AuthExceptionUnathorizedCopyWith<$Res> {
  __$$_AuthExceptionUnathorizedCopyWithImpl(_$_AuthExceptionUnathorized _value,
      $Res Function(_$_AuthExceptionUnathorized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_AuthExceptionUnathorized(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthExceptionUnathorized implements _AuthExceptionUnathorized {
  const _$_AuthExceptionUnathorized([this.message, this.code]);

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthException.unknown(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthExceptionUnathorized &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthExceptionUnathorizedCopyWith<_$_AuthExceptionUnathorized>
      get copyWith => __$$_AuthExceptionUnathorizedCopyWithImpl<
          _$_AuthExceptionUnathorized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) unknown,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message, String? code) invalidCode,
    required TResult Function(String? message, String? code) userNotFound,
    required TResult Function(String? message, String? code) banned,
    required TResult Function(String? message, String? code) userDisabled,
    required TResult Function(String? message, String? code)
        operationNotAllowed,
    required TResult Function(String? message, String? code)
        accountExistsWithDifferentCredentials,
    required TResult Function(String? message, String? code) docDoesNotExist,
  }) {
    return unknown(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? unknown,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message, String? code)? invalidCode,
    TResult? Function(String? message, String? code)? userNotFound,
    TResult? Function(String? message, String? code)? banned,
    TResult? Function(String? message, String? code)? userDisabled,
    TResult? Function(String? message, String? code)? operationNotAllowed,
    TResult? Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult? Function(String? message, String? code)? docDoesNotExist,
  }) {
    return unknown?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? unknown,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message, String? code)? invalidCode,
    TResult Function(String? message, String? code)? userNotFound,
    TResult Function(String? message, String? code)? banned,
    TResult Function(String? message, String? code)? userDisabled,
    TResult Function(String? message, String? code)? operationNotAllowed,
    TResult Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult Function(String? message, String? code)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthExceptionUnathorized value) unknown,
    required TResult Function(_AuthExceptionUnknown value) unauthorized,
    required TResult Function(_AuthExceptionInvalidCode value) invalidCode,
    required TResult Function(_AuthExceptionUserNotFound value) userNotFound,
    required TResult Function(_AuthExceptionUserBanned value) banned,
    required TResult Function(_AuthExceptionUserDisabled value) userDisabled,
    required TResult Function(_AuthExceptionOperationNotAllowed value)
        operationNotAllowed,
    required TResult Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)
        accountExistsWithDifferentCredentials,
    required TResult Function(_AuthExceptionDocDoesNotExist value)
        docDoesNotExist,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthExceptionUnathorized value)? unknown,
    TResult? Function(_AuthExceptionUnknown value)? unauthorized,
    TResult? Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult? Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult? Function(_AuthExceptionUserBanned value)? banned,
    TResult? Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult? Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult? Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult? Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthExceptionUnathorized value)? unknown,
    TResult Function(_AuthExceptionUnknown value)? unauthorized,
    TResult Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult Function(_AuthExceptionUserBanned value)? banned,
    TResult Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult Function(_AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _AuthExceptionUnathorized implements AuthException {
  const factory _AuthExceptionUnathorized(
      [final String? message,
      final String? code]) = _$_AuthExceptionUnathorized;

  @override
  String? get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_AuthExceptionUnathorizedCopyWith<_$_AuthExceptionUnathorized>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthExceptionUnknownCopyWith<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  factory _$$_AuthExceptionUnknownCopyWith(_$_AuthExceptionUnknown value,
          $Res Function(_$_AuthExceptionUnknown) then) =
      __$$_AuthExceptionUnknownCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$_AuthExceptionUnknownCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$_AuthExceptionUnknown>
    implements _$$_AuthExceptionUnknownCopyWith<$Res> {
  __$$_AuthExceptionUnknownCopyWithImpl(_$_AuthExceptionUnknown _value,
      $Res Function(_$_AuthExceptionUnknown) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_AuthExceptionUnknown(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthExceptionUnknown implements _AuthExceptionUnknown {
  const _$_AuthExceptionUnknown([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AuthException.unauthorized(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthExceptionUnknown &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthExceptionUnknownCopyWith<_$_AuthExceptionUnknown> get copyWith =>
      __$$_AuthExceptionUnknownCopyWithImpl<_$_AuthExceptionUnknown>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) unknown,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message, String? code) invalidCode,
    required TResult Function(String? message, String? code) userNotFound,
    required TResult Function(String? message, String? code) banned,
    required TResult Function(String? message, String? code) userDisabled,
    required TResult Function(String? message, String? code)
        operationNotAllowed,
    required TResult Function(String? message, String? code)
        accountExistsWithDifferentCredentials,
    required TResult Function(String? message, String? code) docDoesNotExist,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? unknown,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message, String? code)? invalidCode,
    TResult? Function(String? message, String? code)? userNotFound,
    TResult? Function(String? message, String? code)? banned,
    TResult? Function(String? message, String? code)? userDisabled,
    TResult? Function(String? message, String? code)? operationNotAllowed,
    TResult? Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult? Function(String? message, String? code)? docDoesNotExist,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? unknown,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message, String? code)? invalidCode,
    TResult Function(String? message, String? code)? userNotFound,
    TResult Function(String? message, String? code)? banned,
    TResult Function(String? message, String? code)? userDisabled,
    TResult Function(String? message, String? code)? operationNotAllowed,
    TResult Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult Function(String? message, String? code)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthExceptionUnathorized value) unknown,
    required TResult Function(_AuthExceptionUnknown value) unauthorized,
    required TResult Function(_AuthExceptionInvalidCode value) invalidCode,
    required TResult Function(_AuthExceptionUserNotFound value) userNotFound,
    required TResult Function(_AuthExceptionUserBanned value) banned,
    required TResult Function(_AuthExceptionUserDisabled value) userDisabled,
    required TResult Function(_AuthExceptionOperationNotAllowed value)
        operationNotAllowed,
    required TResult Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)
        accountExistsWithDifferentCredentials,
    required TResult Function(_AuthExceptionDocDoesNotExist value)
        docDoesNotExist,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthExceptionUnathorized value)? unknown,
    TResult? Function(_AuthExceptionUnknown value)? unauthorized,
    TResult? Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult? Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult? Function(_AuthExceptionUserBanned value)? banned,
    TResult? Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult? Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult? Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult? Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthExceptionUnathorized value)? unknown,
    TResult Function(_AuthExceptionUnknown value)? unauthorized,
    TResult Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult Function(_AuthExceptionUserBanned value)? banned,
    TResult Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult Function(_AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _AuthExceptionUnknown implements AuthException {
  const factory _AuthExceptionUnknown([final String? message]) =
      _$_AuthExceptionUnknown;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_AuthExceptionUnknownCopyWith<_$_AuthExceptionUnknown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthExceptionInvalidCodeCopyWith<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  factory _$$_AuthExceptionInvalidCodeCopyWith(
          _$_AuthExceptionInvalidCode value,
          $Res Function(_$_AuthExceptionInvalidCode) then) =
      __$$_AuthExceptionInvalidCodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$_AuthExceptionInvalidCodeCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$_AuthExceptionInvalidCode>
    implements _$$_AuthExceptionInvalidCodeCopyWith<$Res> {
  __$$_AuthExceptionInvalidCodeCopyWithImpl(_$_AuthExceptionInvalidCode _value,
      $Res Function(_$_AuthExceptionInvalidCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_AuthExceptionInvalidCode(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthExceptionInvalidCode implements _AuthExceptionInvalidCode {
  const _$_AuthExceptionInvalidCode([this.message, this.code]);

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthException.invalidCode(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthExceptionInvalidCode &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthExceptionInvalidCodeCopyWith<_$_AuthExceptionInvalidCode>
      get copyWith => __$$_AuthExceptionInvalidCodeCopyWithImpl<
          _$_AuthExceptionInvalidCode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) unknown,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message, String? code) invalidCode,
    required TResult Function(String? message, String? code) userNotFound,
    required TResult Function(String? message, String? code) banned,
    required TResult Function(String? message, String? code) userDisabled,
    required TResult Function(String? message, String? code)
        operationNotAllowed,
    required TResult Function(String? message, String? code)
        accountExistsWithDifferentCredentials,
    required TResult Function(String? message, String? code) docDoesNotExist,
  }) {
    return invalidCode(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? unknown,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message, String? code)? invalidCode,
    TResult? Function(String? message, String? code)? userNotFound,
    TResult? Function(String? message, String? code)? banned,
    TResult? Function(String? message, String? code)? userDisabled,
    TResult? Function(String? message, String? code)? operationNotAllowed,
    TResult? Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult? Function(String? message, String? code)? docDoesNotExist,
  }) {
    return invalidCode?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? unknown,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message, String? code)? invalidCode,
    TResult Function(String? message, String? code)? userNotFound,
    TResult Function(String? message, String? code)? banned,
    TResult Function(String? message, String? code)? userDisabled,
    TResult Function(String? message, String? code)? operationNotAllowed,
    TResult Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult Function(String? message, String? code)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (invalidCode != null) {
      return invalidCode(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthExceptionUnathorized value) unknown,
    required TResult Function(_AuthExceptionUnknown value) unauthorized,
    required TResult Function(_AuthExceptionInvalidCode value) invalidCode,
    required TResult Function(_AuthExceptionUserNotFound value) userNotFound,
    required TResult Function(_AuthExceptionUserBanned value) banned,
    required TResult Function(_AuthExceptionUserDisabled value) userDisabled,
    required TResult Function(_AuthExceptionOperationNotAllowed value)
        operationNotAllowed,
    required TResult Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)
        accountExistsWithDifferentCredentials,
    required TResult Function(_AuthExceptionDocDoesNotExist value)
        docDoesNotExist,
  }) {
    return invalidCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthExceptionUnathorized value)? unknown,
    TResult? Function(_AuthExceptionUnknown value)? unauthorized,
    TResult? Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult? Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult? Function(_AuthExceptionUserBanned value)? banned,
    TResult? Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult? Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult? Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult? Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
  }) {
    return invalidCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthExceptionUnathorized value)? unknown,
    TResult Function(_AuthExceptionUnknown value)? unauthorized,
    TResult Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult Function(_AuthExceptionUserBanned value)? banned,
    TResult Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult Function(_AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (invalidCode != null) {
      return invalidCode(this);
    }
    return orElse();
  }
}

abstract class _AuthExceptionInvalidCode implements AuthException {
  const factory _AuthExceptionInvalidCode(
      [final String? message,
      final String? code]) = _$_AuthExceptionInvalidCode;

  @override
  String? get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_AuthExceptionInvalidCodeCopyWith<_$_AuthExceptionInvalidCode>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthExceptionUserNotFoundCopyWith<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  factory _$$_AuthExceptionUserNotFoundCopyWith(
          _$_AuthExceptionUserNotFound value,
          $Res Function(_$_AuthExceptionUserNotFound) then) =
      __$$_AuthExceptionUserNotFoundCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$_AuthExceptionUserNotFoundCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$_AuthExceptionUserNotFound>
    implements _$$_AuthExceptionUserNotFoundCopyWith<$Res> {
  __$$_AuthExceptionUserNotFoundCopyWithImpl(
      _$_AuthExceptionUserNotFound _value,
      $Res Function(_$_AuthExceptionUserNotFound) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_AuthExceptionUserNotFound(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthExceptionUserNotFound implements _AuthExceptionUserNotFound {
  const _$_AuthExceptionUserNotFound([this.message, this.code]);

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthException.userNotFound(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthExceptionUserNotFound &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthExceptionUserNotFoundCopyWith<_$_AuthExceptionUserNotFound>
      get copyWith => __$$_AuthExceptionUserNotFoundCopyWithImpl<
          _$_AuthExceptionUserNotFound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) unknown,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message, String? code) invalidCode,
    required TResult Function(String? message, String? code) userNotFound,
    required TResult Function(String? message, String? code) banned,
    required TResult Function(String? message, String? code) userDisabled,
    required TResult Function(String? message, String? code)
        operationNotAllowed,
    required TResult Function(String? message, String? code)
        accountExistsWithDifferentCredentials,
    required TResult Function(String? message, String? code) docDoesNotExist,
  }) {
    return userNotFound(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? unknown,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message, String? code)? invalidCode,
    TResult? Function(String? message, String? code)? userNotFound,
    TResult? Function(String? message, String? code)? banned,
    TResult? Function(String? message, String? code)? userDisabled,
    TResult? Function(String? message, String? code)? operationNotAllowed,
    TResult? Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult? Function(String? message, String? code)? docDoesNotExist,
  }) {
    return userNotFound?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? unknown,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message, String? code)? invalidCode,
    TResult Function(String? message, String? code)? userNotFound,
    TResult Function(String? message, String? code)? banned,
    TResult Function(String? message, String? code)? userDisabled,
    TResult Function(String? message, String? code)? operationNotAllowed,
    TResult Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult Function(String? message, String? code)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthExceptionUnathorized value) unknown,
    required TResult Function(_AuthExceptionUnknown value) unauthorized,
    required TResult Function(_AuthExceptionInvalidCode value) invalidCode,
    required TResult Function(_AuthExceptionUserNotFound value) userNotFound,
    required TResult Function(_AuthExceptionUserBanned value) banned,
    required TResult Function(_AuthExceptionUserDisabled value) userDisabled,
    required TResult Function(_AuthExceptionOperationNotAllowed value)
        operationNotAllowed,
    required TResult Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)
        accountExistsWithDifferentCredentials,
    required TResult Function(_AuthExceptionDocDoesNotExist value)
        docDoesNotExist,
  }) {
    return userNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthExceptionUnathorized value)? unknown,
    TResult? Function(_AuthExceptionUnknown value)? unauthorized,
    TResult? Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult? Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult? Function(_AuthExceptionUserBanned value)? banned,
    TResult? Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult? Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult? Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult? Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
  }) {
    return userNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthExceptionUnathorized value)? unknown,
    TResult Function(_AuthExceptionUnknown value)? unauthorized,
    TResult Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult Function(_AuthExceptionUserBanned value)? banned,
    TResult Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult Function(_AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (userNotFound != null) {
      return userNotFound(this);
    }
    return orElse();
  }
}

abstract class _AuthExceptionUserNotFound implements AuthException {
  const factory _AuthExceptionUserNotFound(
      [final String? message,
      final String? code]) = _$_AuthExceptionUserNotFound;

  @override
  String? get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_AuthExceptionUserNotFoundCopyWith<_$_AuthExceptionUserNotFound>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthExceptionUserBannedCopyWith<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  factory _$$_AuthExceptionUserBannedCopyWith(_$_AuthExceptionUserBanned value,
          $Res Function(_$_AuthExceptionUserBanned) then) =
      __$$_AuthExceptionUserBannedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$_AuthExceptionUserBannedCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$_AuthExceptionUserBanned>
    implements _$$_AuthExceptionUserBannedCopyWith<$Res> {
  __$$_AuthExceptionUserBannedCopyWithImpl(_$_AuthExceptionUserBanned _value,
      $Res Function(_$_AuthExceptionUserBanned) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_AuthExceptionUserBanned(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthExceptionUserBanned implements _AuthExceptionUserBanned {
  const _$_AuthExceptionUserBanned([this.message, this.code]);

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthException.banned(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthExceptionUserBanned &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthExceptionUserBannedCopyWith<_$_AuthExceptionUserBanned>
      get copyWith =>
          __$$_AuthExceptionUserBannedCopyWithImpl<_$_AuthExceptionUserBanned>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) unknown,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message, String? code) invalidCode,
    required TResult Function(String? message, String? code) userNotFound,
    required TResult Function(String? message, String? code) banned,
    required TResult Function(String? message, String? code) userDisabled,
    required TResult Function(String? message, String? code)
        operationNotAllowed,
    required TResult Function(String? message, String? code)
        accountExistsWithDifferentCredentials,
    required TResult Function(String? message, String? code) docDoesNotExist,
  }) {
    return banned(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? unknown,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message, String? code)? invalidCode,
    TResult? Function(String? message, String? code)? userNotFound,
    TResult? Function(String? message, String? code)? banned,
    TResult? Function(String? message, String? code)? userDisabled,
    TResult? Function(String? message, String? code)? operationNotAllowed,
    TResult? Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult? Function(String? message, String? code)? docDoesNotExist,
  }) {
    return banned?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? unknown,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message, String? code)? invalidCode,
    TResult Function(String? message, String? code)? userNotFound,
    TResult Function(String? message, String? code)? banned,
    TResult Function(String? message, String? code)? userDisabled,
    TResult Function(String? message, String? code)? operationNotAllowed,
    TResult Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult Function(String? message, String? code)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (banned != null) {
      return banned(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthExceptionUnathorized value) unknown,
    required TResult Function(_AuthExceptionUnknown value) unauthorized,
    required TResult Function(_AuthExceptionInvalidCode value) invalidCode,
    required TResult Function(_AuthExceptionUserNotFound value) userNotFound,
    required TResult Function(_AuthExceptionUserBanned value) banned,
    required TResult Function(_AuthExceptionUserDisabled value) userDisabled,
    required TResult Function(_AuthExceptionOperationNotAllowed value)
        operationNotAllowed,
    required TResult Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)
        accountExistsWithDifferentCredentials,
    required TResult Function(_AuthExceptionDocDoesNotExist value)
        docDoesNotExist,
  }) {
    return banned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthExceptionUnathorized value)? unknown,
    TResult? Function(_AuthExceptionUnknown value)? unauthorized,
    TResult? Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult? Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult? Function(_AuthExceptionUserBanned value)? banned,
    TResult? Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult? Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult? Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult? Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
  }) {
    return banned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthExceptionUnathorized value)? unknown,
    TResult Function(_AuthExceptionUnknown value)? unauthorized,
    TResult Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult Function(_AuthExceptionUserBanned value)? banned,
    TResult Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult Function(_AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (banned != null) {
      return banned(this);
    }
    return orElse();
  }
}

abstract class _AuthExceptionUserBanned implements AuthException {
  const factory _AuthExceptionUserBanned(
      [final String? message, final String? code]) = _$_AuthExceptionUserBanned;

  @override
  String? get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_AuthExceptionUserBannedCopyWith<_$_AuthExceptionUserBanned>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthExceptionUserDisabledCopyWith<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  factory _$$_AuthExceptionUserDisabledCopyWith(
          _$_AuthExceptionUserDisabled value,
          $Res Function(_$_AuthExceptionUserDisabled) then) =
      __$$_AuthExceptionUserDisabledCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$_AuthExceptionUserDisabledCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$_AuthExceptionUserDisabled>
    implements _$$_AuthExceptionUserDisabledCopyWith<$Res> {
  __$$_AuthExceptionUserDisabledCopyWithImpl(
      _$_AuthExceptionUserDisabled _value,
      $Res Function(_$_AuthExceptionUserDisabled) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_AuthExceptionUserDisabled(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthExceptionUserDisabled implements _AuthExceptionUserDisabled {
  const _$_AuthExceptionUserDisabled([this.message, this.code]);

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthException.userDisabled(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthExceptionUserDisabled &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthExceptionUserDisabledCopyWith<_$_AuthExceptionUserDisabled>
      get copyWith => __$$_AuthExceptionUserDisabledCopyWithImpl<
          _$_AuthExceptionUserDisabled>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) unknown,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message, String? code) invalidCode,
    required TResult Function(String? message, String? code) userNotFound,
    required TResult Function(String? message, String? code) banned,
    required TResult Function(String? message, String? code) userDisabled,
    required TResult Function(String? message, String? code)
        operationNotAllowed,
    required TResult Function(String? message, String? code)
        accountExistsWithDifferentCredentials,
    required TResult Function(String? message, String? code) docDoesNotExist,
  }) {
    return userDisabled(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? unknown,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message, String? code)? invalidCode,
    TResult? Function(String? message, String? code)? userNotFound,
    TResult? Function(String? message, String? code)? banned,
    TResult? Function(String? message, String? code)? userDisabled,
    TResult? Function(String? message, String? code)? operationNotAllowed,
    TResult? Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult? Function(String? message, String? code)? docDoesNotExist,
  }) {
    return userDisabled?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? unknown,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message, String? code)? invalidCode,
    TResult Function(String? message, String? code)? userNotFound,
    TResult Function(String? message, String? code)? banned,
    TResult Function(String? message, String? code)? userDisabled,
    TResult Function(String? message, String? code)? operationNotAllowed,
    TResult Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult Function(String? message, String? code)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (userDisabled != null) {
      return userDisabled(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthExceptionUnathorized value) unknown,
    required TResult Function(_AuthExceptionUnknown value) unauthorized,
    required TResult Function(_AuthExceptionInvalidCode value) invalidCode,
    required TResult Function(_AuthExceptionUserNotFound value) userNotFound,
    required TResult Function(_AuthExceptionUserBanned value) banned,
    required TResult Function(_AuthExceptionUserDisabled value) userDisabled,
    required TResult Function(_AuthExceptionOperationNotAllowed value)
        operationNotAllowed,
    required TResult Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)
        accountExistsWithDifferentCredentials,
    required TResult Function(_AuthExceptionDocDoesNotExist value)
        docDoesNotExist,
  }) {
    return userDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthExceptionUnathorized value)? unknown,
    TResult? Function(_AuthExceptionUnknown value)? unauthorized,
    TResult? Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult? Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult? Function(_AuthExceptionUserBanned value)? banned,
    TResult? Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult? Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult? Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult? Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
  }) {
    return userDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthExceptionUnathorized value)? unknown,
    TResult Function(_AuthExceptionUnknown value)? unauthorized,
    TResult Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult Function(_AuthExceptionUserBanned value)? banned,
    TResult Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult Function(_AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (userDisabled != null) {
      return userDisabled(this);
    }
    return orElse();
  }
}

abstract class _AuthExceptionUserDisabled implements AuthException {
  const factory _AuthExceptionUserDisabled(
      [final String? message,
      final String? code]) = _$_AuthExceptionUserDisabled;

  @override
  String? get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_AuthExceptionUserDisabledCopyWith<_$_AuthExceptionUserDisabled>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthExceptionOperationNotAllowedCopyWith<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  factory _$$_AuthExceptionOperationNotAllowedCopyWith(
          _$_AuthExceptionOperationNotAllowed value,
          $Res Function(_$_AuthExceptionOperationNotAllowed) then) =
      __$$_AuthExceptionOperationNotAllowedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$_AuthExceptionOperationNotAllowedCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res,
        _$_AuthExceptionOperationNotAllowed>
    implements _$$_AuthExceptionOperationNotAllowedCopyWith<$Res> {
  __$$_AuthExceptionOperationNotAllowedCopyWithImpl(
      _$_AuthExceptionOperationNotAllowed _value,
      $Res Function(_$_AuthExceptionOperationNotAllowed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_AuthExceptionOperationNotAllowed(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthExceptionOperationNotAllowed
    implements _AuthExceptionOperationNotAllowed {
  const _$_AuthExceptionOperationNotAllowed([this.message, this.code]);

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthException.operationNotAllowed(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthExceptionOperationNotAllowed &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthExceptionOperationNotAllowedCopyWith<
          _$_AuthExceptionOperationNotAllowed>
      get copyWith => __$$_AuthExceptionOperationNotAllowedCopyWithImpl<
          _$_AuthExceptionOperationNotAllowed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) unknown,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message, String? code) invalidCode,
    required TResult Function(String? message, String? code) userNotFound,
    required TResult Function(String? message, String? code) banned,
    required TResult Function(String? message, String? code) userDisabled,
    required TResult Function(String? message, String? code)
        operationNotAllowed,
    required TResult Function(String? message, String? code)
        accountExistsWithDifferentCredentials,
    required TResult Function(String? message, String? code) docDoesNotExist,
  }) {
    return operationNotAllowed(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? unknown,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message, String? code)? invalidCode,
    TResult? Function(String? message, String? code)? userNotFound,
    TResult? Function(String? message, String? code)? banned,
    TResult? Function(String? message, String? code)? userDisabled,
    TResult? Function(String? message, String? code)? operationNotAllowed,
    TResult? Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult? Function(String? message, String? code)? docDoesNotExist,
  }) {
    return operationNotAllowed?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? unknown,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message, String? code)? invalidCode,
    TResult Function(String? message, String? code)? userNotFound,
    TResult Function(String? message, String? code)? banned,
    TResult Function(String? message, String? code)? userDisabled,
    TResult Function(String? message, String? code)? operationNotAllowed,
    TResult Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult Function(String? message, String? code)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (operationNotAllowed != null) {
      return operationNotAllowed(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthExceptionUnathorized value) unknown,
    required TResult Function(_AuthExceptionUnknown value) unauthorized,
    required TResult Function(_AuthExceptionInvalidCode value) invalidCode,
    required TResult Function(_AuthExceptionUserNotFound value) userNotFound,
    required TResult Function(_AuthExceptionUserBanned value) banned,
    required TResult Function(_AuthExceptionUserDisabled value) userDisabled,
    required TResult Function(_AuthExceptionOperationNotAllowed value)
        operationNotAllowed,
    required TResult Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)
        accountExistsWithDifferentCredentials,
    required TResult Function(_AuthExceptionDocDoesNotExist value)
        docDoesNotExist,
  }) {
    return operationNotAllowed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthExceptionUnathorized value)? unknown,
    TResult? Function(_AuthExceptionUnknown value)? unauthorized,
    TResult? Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult? Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult? Function(_AuthExceptionUserBanned value)? banned,
    TResult? Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult? Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult? Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult? Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
  }) {
    return operationNotAllowed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthExceptionUnathorized value)? unknown,
    TResult Function(_AuthExceptionUnknown value)? unauthorized,
    TResult Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult Function(_AuthExceptionUserBanned value)? banned,
    TResult Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult Function(_AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (operationNotAllowed != null) {
      return operationNotAllowed(this);
    }
    return orElse();
  }
}

abstract class _AuthExceptionOperationNotAllowed implements AuthException {
  const factory _AuthExceptionOperationNotAllowed(
      [final String? message,
      final String? code]) = _$_AuthExceptionOperationNotAllowed;

  @override
  String? get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_AuthExceptionOperationNotAllowedCopyWith<
          _$_AuthExceptionOperationNotAllowed>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthExceptionOperationAccountExistsDiffCredentialsCopyWith<
    $Res> implements $AuthExceptionCopyWith<$Res> {
  factory _$$_AuthExceptionOperationAccountExistsDiffCredentialsCopyWith(
          _$_AuthExceptionOperationAccountExistsDiffCredentials value,
          $Res Function(_$_AuthExceptionOperationAccountExistsDiffCredentials)
              then) =
      __$$_AuthExceptionOperationAccountExistsDiffCredentialsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$_AuthExceptionOperationAccountExistsDiffCredentialsCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res,
        _$_AuthExceptionOperationAccountExistsDiffCredentials>
    implements
        _$$_AuthExceptionOperationAccountExistsDiffCredentialsCopyWith<$Res> {
  __$$_AuthExceptionOperationAccountExistsDiffCredentialsCopyWithImpl(
      _$_AuthExceptionOperationAccountExistsDiffCredentials _value,
      $Res Function(_$_AuthExceptionOperationAccountExistsDiffCredentials)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_AuthExceptionOperationAccountExistsDiffCredentials(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthExceptionOperationAccountExistsDiffCredentials
    implements _AuthExceptionOperationAccountExistsDiffCredentials {
  const _$_AuthExceptionOperationAccountExistsDiffCredentials(
      [this.message, this.code]);

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthException.accountExistsWithDifferentCredentials(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthExceptionOperationAccountExistsDiffCredentials &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthExceptionOperationAccountExistsDiffCredentialsCopyWith<
          _$_AuthExceptionOperationAccountExistsDiffCredentials>
      get copyWith =>
          __$$_AuthExceptionOperationAccountExistsDiffCredentialsCopyWithImpl<
                  _$_AuthExceptionOperationAccountExistsDiffCredentials>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) unknown,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message, String? code) invalidCode,
    required TResult Function(String? message, String? code) userNotFound,
    required TResult Function(String? message, String? code) banned,
    required TResult Function(String? message, String? code) userDisabled,
    required TResult Function(String? message, String? code)
        operationNotAllowed,
    required TResult Function(String? message, String? code)
        accountExistsWithDifferentCredentials,
    required TResult Function(String? message, String? code) docDoesNotExist,
  }) {
    return accountExistsWithDifferentCredentials(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? unknown,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message, String? code)? invalidCode,
    TResult? Function(String? message, String? code)? userNotFound,
    TResult? Function(String? message, String? code)? banned,
    TResult? Function(String? message, String? code)? userDisabled,
    TResult? Function(String? message, String? code)? operationNotAllowed,
    TResult? Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult? Function(String? message, String? code)? docDoesNotExist,
  }) {
    return accountExistsWithDifferentCredentials?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? unknown,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message, String? code)? invalidCode,
    TResult Function(String? message, String? code)? userNotFound,
    TResult Function(String? message, String? code)? banned,
    TResult Function(String? message, String? code)? userDisabled,
    TResult Function(String? message, String? code)? operationNotAllowed,
    TResult Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult Function(String? message, String? code)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (accountExistsWithDifferentCredentials != null) {
      return accountExistsWithDifferentCredentials(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthExceptionUnathorized value) unknown,
    required TResult Function(_AuthExceptionUnknown value) unauthorized,
    required TResult Function(_AuthExceptionInvalidCode value) invalidCode,
    required TResult Function(_AuthExceptionUserNotFound value) userNotFound,
    required TResult Function(_AuthExceptionUserBanned value) banned,
    required TResult Function(_AuthExceptionUserDisabled value) userDisabled,
    required TResult Function(_AuthExceptionOperationNotAllowed value)
        operationNotAllowed,
    required TResult Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)
        accountExistsWithDifferentCredentials,
    required TResult Function(_AuthExceptionDocDoesNotExist value)
        docDoesNotExist,
  }) {
    return accountExistsWithDifferentCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthExceptionUnathorized value)? unknown,
    TResult? Function(_AuthExceptionUnknown value)? unauthorized,
    TResult? Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult? Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult? Function(_AuthExceptionUserBanned value)? banned,
    TResult? Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult? Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult? Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult? Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
  }) {
    return accountExistsWithDifferentCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthExceptionUnathorized value)? unknown,
    TResult Function(_AuthExceptionUnknown value)? unauthorized,
    TResult Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult Function(_AuthExceptionUserBanned value)? banned,
    TResult Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult Function(_AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (accountExistsWithDifferentCredentials != null) {
      return accountExistsWithDifferentCredentials(this);
    }
    return orElse();
  }
}

abstract class _AuthExceptionOperationAccountExistsDiffCredentials
    implements AuthException {
  const factory _AuthExceptionOperationAccountExistsDiffCredentials(
          [final String? message, final String? code]) =
      _$_AuthExceptionOperationAccountExistsDiffCredentials;

  @override
  String? get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_AuthExceptionOperationAccountExistsDiffCredentialsCopyWith<
          _$_AuthExceptionOperationAccountExistsDiffCredentials>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthExceptionDocDoesNotExistCopyWith<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  factory _$$_AuthExceptionDocDoesNotExistCopyWith(
          _$_AuthExceptionDocDoesNotExist value,
          $Res Function(_$_AuthExceptionDocDoesNotExist) then) =
      __$$_AuthExceptionDocDoesNotExistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? code});
}

/// @nodoc
class __$$_AuthExceptionDocDoesNotExistCopyWithImpl<$Res>
    extends _$AuthExceptionCopyWithImpl<$Res, _$_AuthExceptionDocDoesNotExist>
    implements _$$_AuthExceptionDocDoesNotExistCopyWith<$Res> {
  __$$_AuthExceptionDocDoesNotExistCopyWithImpl(
      _$_AuthExceptionDocDoesNotExist _value,
      $Res Function(_$_AuthExceptionDocDoesNotExist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_AuthExceptionDocDoesNotExist(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthExceptionDocDoesNotExist implements _AuthExceptionDocDoesNotExist {
  const _$_AuthExceptionDocDoesNotExist([this.message, this.code]);

  @override
  final String? message;
  @override
  final String? code;

  @override
  String toString() {
    return 'AuthException.docDoesNotExist(message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthExceptionDocDoesNotExist &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthExceptionDocDoesNotExistCopyWith<_$_AuthExceptionDocDoesNotExist>
      get copyWith => __$$_AuthExceptionDocDoesNotExistCopyWithImpl<
          _$_AuthExceptionDocDoesNotExist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message, String? code) unknown,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message, String? code) invalidCode,
    required TResult Function(String? message, String? code) userNotFound,
    required TResult Function(String? message, String? code) banned,
    required TResult Function(String? message, String? code) userDisabled,
    required TResult Function(String? message, String? code)
        operationNotAllowed,
    required TResult Function(String? message, String? code)
        accountExistsWithDifferentCredentials,
    required TResult Function(String? message, String? code) docDoesNotExist,
  }) {
    return docDoesNotExist(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message, String? code)? unknown,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message, String? code)? invalidCode,
    TResult? Function(String? message, String? code)? userNotFound,
    TResult? Function(String? message, String? code)? banned,
    TResult? Function(String? message, String? code)? userDisabled,
    TResult? Function(String? message, String? code)? operationNotAllowed,
    TResult? Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult? Function(String? message, String? code)? docDoesNotExist,
  }) {
    return docDoesNotExist?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message, String? code)? unknown,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message, String? code)? invalidCode,
    TResult Function(String? message, String? code)? userNotFound,
    TResult Function(String? message, String? code)? banned,
    TResult Function(String? message, String? code)? userDisabled,
    TResult Function(String? message, String? code)? operationNotAllowed,
    TResult Function(String? message, String? code)?
        accountExistsWithDifferentCredentials,
    TResult Function(String? message, String? code)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (docDoesNotExist != null) {
      return docDoesNotExist(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthExceptionUnathorized value) unknown,
    required TResult Function(_AuthExceptionUnknown value) unauthorized,
    required TResult Function(_AuthExceptionInvalidCode value) invalidCode,
    required TResult Function(_AuthExceptionUserNotFound value) userNotFound,
    required TResult Function(_AuthExceptionUserBanned value) banned,
    required TResult Function(_AuthExceptionUserDisabled value) userDisabled,
    required TResult Function(_AuthExceptionOperationNotAllowed value)
        operationNotAllowed,
    required TResult Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)
        accountExistsWithDifferentCredentials,
    required TResult Function(_AuthExceptionDocDoesNotExist value)
        docDoesNotExist,
  }) {
    return docDoesNotExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthExceptionUnathorized value)? unknown,
    TResult? Function(_AuthExceptionUnknown value)? unauthorized,
    TResult? Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult? Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult? Function(_AuthExceptionUserBanned value)? banned,
    TResult? Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult? Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult? Function(
            _AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult? Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
  }) {
    return docDoesNotExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthExceptionUnathorized value)? unknown,
    TResult Function(_AuthExceptionUnknown value)? unauthorized,
    TResult Function(_AuthExceptionInvalidCode value)? invalidCode,
    TResult Function(_AuthExceptionUserNotFound value)? userNotFound,
    TResult Function(_AuthExceptionUserBanned value)? banned,
    TResult Function(_AuthExceptionUserDisabled value)? userDisabled,
    TResult Function(_AuthExceptionOperationNotAllowed value)?
        operationNotAllowed,
    TResult Function(_AuthExceptionOperationAccountExistsDiffCredentials value)?
        accountExistsWithDifferentCredentials,
    TResult Function(_AuthExceptionDocDoesNotExist value)? docDoesNotExist,
    required TResult orElse(),
  }) {
    if (docDoesNotExist != null) {
      return docDoesNotExist(this);
    }
    return orElse();
  }
}

abstract class _AuthExceptionDocDoesNotExist implements AuthException {
  const factory _AuthExceptionDocDoesNotExist(
      [final String? message,
      final String? code]) = _$_AuthExceptionDocDoesNotExist;

  @override
  String? get message;
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_AuthExceptionDocDoesNotExistCopyWith<_$_AuthExceptionDocDoesNotExist>
      get copyWith => throw _privateConstructorUsedError;
}
