import 'package:flutter/material.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

import '../shared/bloc/state_base.dart';

class AppState extends StateBase {
  AppState._({
    required this.navigatorKey,
    required this.isIntroAccepted,
    required this.isSignedIn,
    required this.hasOpenRoute,
    Failure? failure,
  }) : super(
          failure: failure,
        );

  factory AppState.initialize(
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    return AppState._(
      navigatorKey: GlobalKey<NavigatorState>(),
      isIntroAccepted: null,
      isSignedIn: null,
      hasOpenRoute: null,
    );
  }

  final GlobalKey<NavigatorState> navigatorKey;

  final bool? isIntroAccepted;
  final bool? isSignedIn;
  final bool? hasOpenRoute;

  bool get loaded =>
      isIntroAccepted != null && isSignedIn != null && hasOpenRoute != null;

  AppState copyWith({
    bool? isIntroAccepted,
    bool? isSignedIn,
    bool? hasOpenRoute,
  }) {
    return AppState._(
      navigatorKey: navigatorKey,
      isIntroAccepted: isIntroAccepted ?? this.isIntroAccepted,
      isSignedIn: isSignedIn ?? this.isSignedIn,
      hasOpenRoute: hasOpenRoute ?? this.hasOpenRoute,
    );
  }
}
