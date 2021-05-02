import 'package:flutter/material.dart';

class AppState {
  const AppState._({
    required this.navigatorKey,
    required this.introAccepted,
  });

  factory AppState.initialize(
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    return AppState._(
      navigatorKey: GlobalKey<NavigatorState>(),
      introAccepted: null,
    );
  }

  final GlobalKey<NavigatorState> navigatorKey;

  final bool? introAccepted;

  bool get loaded => introAccepted != null;

  AppState copyWith({
    bool? introAccepted,
  }) {
    return AppState._(
      navigatorKey: navigatorKey,
      introAccepted: introAccepted ?? this.introAccepted,
    );
  }
}
