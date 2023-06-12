import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wegift/exceptions/auth_exception/auth_exception.dart';
import 'package:wegift/src/auth/domain/entities/we_gift_user/we_gift_user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.none() = _AuthStateNone;
  const factory AuthState.logOut() = _AuthStateLogOut;
  const factory AuthState.loggedIn(WeGiftUser user) = _AuthStateLoggedIn;
  const factory AuthState.loggingIn(AuthType type) = _AuthStateLoggingIn;
  const factory AuthState.noUser() = _AuthStateNoUser;
  const factory AuthState.error(AuthException e) = _AuthStateError;
  const factory AuthState.otpSent(String phoneNumber, String verificationId) = _AuthStateOtopSent;
}

enum AuthType { emailAndPassword, facebook, google, apple, phone, persistance }
