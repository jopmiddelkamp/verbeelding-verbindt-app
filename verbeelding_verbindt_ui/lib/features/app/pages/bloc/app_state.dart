import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/route.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initializing() = AppInitializing;
  const factory AppState.loaded({
    required bool hasAcceptedIntro,
    required bool hasSignedIn,
    required RouteEntity? route,
  }) = AppLoaded;
  const factory AppState.failed([
    Failure? failure,
  ]) = AppFailed;
}

extension AppLoadedX on AppLoaded {
  bool get hasNotAcceptedIntro => !hasAcceptedIntro;
  bool get hasNotSignedIn => !hasSignedIn;
  bool get hasActiveRoute => route != null;
  bool get hasNoActiveRoute => !hasActiveRoute;
  bool get hasCompletedRoute => route?.completed == true;
  bool get hasNoCompletedRoute => !hasCompletedRoute;
}
