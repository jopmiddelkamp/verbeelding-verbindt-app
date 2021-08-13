import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initializing() = AppInitializing;
  const factory AppState.loaded({
    required bool hasAcceptedIntro,
    required bool hasSignedIn,
    required bool hasActiveRoute,
  }) = AppLoaded;
  const factory AppState.failed([
    Failure? failure,
  ]) = AppFailed;
}

extension AppLoadedX on AppLoaded {
  bool get hasNotAcceptedIntro => !hasAcceptedIntro;
  bool get hasNotSignedIn => !hasSignedIn;
  bool get hasNoActiveRoute => !hasActiveRoute;
}
