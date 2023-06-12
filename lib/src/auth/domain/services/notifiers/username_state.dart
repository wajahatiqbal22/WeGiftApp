import 'package:freezed_annotation/freezed_annotation.dart';

part 'username_state.freezed.dart';

@freezed
abstract class UsernameState implements _$UsernameState {
  const UsernameState._();

  const factory UsernameState.noUsername() = _NousernameState;
  const factory UsernameState.found() = _FoundUsername;
  const factory UsernameState.error() = _Error;
}
