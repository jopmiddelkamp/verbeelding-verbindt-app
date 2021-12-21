import 'package:go_router/go_router.dart';

import '../../../verbeelding_verbindt_ui.dart';

String? topLevelGuard(
  AppState appState,
  GoRouterState state,
) {
  if (appState is! AppLoaded) {
    return null;
  }

  final hasAcceptedIntro = appState.hasAcceptedIntro;
  final hasActiveRoute = appState.hasActiveRoute;
  final hasCompletedRoute = appState.hasCompletedRoute;

  final visitIntro = state.location == '/intro';
  final visitSelectInterests = state.location == '/guide/select-interests';
  final visitStepsOverview = state.location == '/guide/steps';
  final visitCompleted = state.location == '/guide/completed';

  if (!visitIntro && !hasAcceptedIntro) {
    return '/intro';
  }
  if (visitIntro && hasAcceptedIntro) {
    return '/guide/select-interests';
  }

  if (!visitIntro && !visitSelectInterests && !hasActiveRoute) {
    return '/guide/select-interests';
  }
  if (visitSelectInterests && hasActiveRoute) {
    return '/guide/steps';
  }

  if (visitStepsOverview && hasCompletedRoute) {
    return '/guide/completed';
  }
  if (visitCompleted && !hasCompletedRoute) {
    return '/guide/steps';
  }

  return null;
}
