import 'package:flutter_ivn/app/global/state/status/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(Status.initial()) Status status,
  }) = _AuthState;
}
