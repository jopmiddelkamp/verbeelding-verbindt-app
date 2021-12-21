import 'package:go_router/go_router.dart';

import '../../../verbeelding_verbindt_ui.dart';

String? topLevelGuard(
  AppState appState,
  GoRouterState state,
) {
  if (appState is! AppLoaded) {
    return null;
  }

  /// If the app is starting
  if (state.location == '/') {
    final hasAcceptedIntro = appState.hasAcceptedIntro;
    final hasActiveRoute = appState.hasActiveRoute;
    final hasCompletedRoute = appState.hasCompletedRoute;

    if (!hasAcceptedIntro) {
      return null;
    }

    if (!hasActiveRoute) {
      return '/guide/select-interests';
    }

    if (!hasCompletedRoute) {
      return '/guide/stops';
    }

    return '/guide/completed';
  }

  return null;
}
