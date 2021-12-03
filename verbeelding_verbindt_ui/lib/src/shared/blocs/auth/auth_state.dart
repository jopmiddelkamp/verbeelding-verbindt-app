import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initializing() = AuthInitializing;
  const factory AuthState.loaded({
    required UserEntity? authenticatedUser,
  }) = AuthLoaded;
  const factory AuthState.failed([
    Failure? failure,
  ]) = AuthFailed;
}

extension AuthLoadedX on AuthLoaded {
  bool get isSignedIn => authenticatedUser != null;
  bool get isNotSignedIn => !isSignedIn;
}
