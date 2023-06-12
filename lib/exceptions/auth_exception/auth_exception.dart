// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_exception.freezed.dart';

@freezed
abstract class AuthException with _$AuthException implements Exception {
  const factory AuthException.unknown([String? message, String? code]) = _AuthExceptionUnathorized;
  const factory AuthException.unauthorized([String? message]) = _AuthExceptionUnknown;

  const factory AuthException.invalidCode([String? message, String? code]) =
      _AuthExceptionInvalidCode;
  const factory AuthException.userNotFound([String? message, String? code]) =
      _AuthExceptionUserNotFound;
  const factory AuthException.banned([String? message, String? code]) = _AuthExceptionUserBanned;
  const factory AuthException.userDisabled([String? message, String? code]) =
      _AuthExceptionUserDisabled;
  const factory AuthException.operationNotAllowed([String? message, String? code]) =
      _AuthExceptionOperationNotAllowed;
  const factory AuthException.accountExistsWithDifferentCredentials(
      [String? message, String? code]) = _AuthExceptionOperationAccountExistsDiffCredentials;
  const factory AuthException.docDoesNotExist([String? message, String? code]) =
      _AuthExceptionDocDoesNotExist;

  static String getMessage(BuildContext context, AuthException e) {
    return e.when(unknown: (message, code) {
      return "Something went wrong, try again later.";
    }, invalidCode: (message, code) {
      return "Invalid code";
    }, userNotFound: (message, code) {
      return "These details do not match with an existing user.";
    }, userDisabled: (message, code) {
      return "Your account has been disabled.";
    }, banned: (message, code) {
      return "You account has been banned.";
    }, operationNotAllowed: (message, code) {
      return "That operation is not allowed.";
    }, accountExistsWithDifferentCredentials: (message, code) {
      return "That account already exists, try again.";
    }, unauthorized: (String? message) {
      return "Unauthroized request, try again later";
    }, docDoesNotExist: (String? message, String? code) {
      return 'Document in firestore does not exist';
    });
  }
}
