import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/repositories/auth_repository.dart';
import 'package:verbeelding_verbindt_core/repositories/route_repository.dart';
import 'package:verbeelding_verbindt_core/services/persistent_storage_service.dart';

import '../shared/bloc/cubit_base.dart';
import 'app_state.dart';

class AppCubit extends CubitBase<AppState> {
  AppCubit({
    required PersistentStorageService persistentStorageService,
    required AuthRepository authRepository,
    required RouteRepository routeRepository,
    required GlobalKey<NavigatorState> navigatorKey,
  })  : _authRepository = authRepository,
        _persistentStorage = persistentStorageService,
        _routeRepository = routeRepository,
        super(AppState.initialize(navigatorKey)) {
    _init();
  }

  final AuthRepository _authRepository;
  final PersistentStorageService _persistentStorage;
  final RouteRepository _routeRepository;

  Future<void> _init() async {
    _initIsIntroAccepted();
    await _initIsSignedIn();
    _initHasOpenRoute();
  }

  Future<void> _initIsIntroAccepted() async {
    final isIntroAccepted = await _persistentStorage.getIsIntroAccepted();
    emit(state.copyWith(
      isIntroAccepted: isIntroAccepted,
    ));
  }

  /// Seems a little pointless for now but if auth needed in later stage it's
  /// ready to be implemented
  Future<void> _initIsSignedIn() async {
    await _authRepository.signInAnonymously();
    emit(state.copyWith(
      isSignedIn: true,
    ));
    _authRepository
        .signedInStateChanged()
        .takeUntil(dispose$)
        .listen((signedIn) async {
      if (!signedIn) {
        // Maybe change to redirect to login page later
        await _authRepository.signInAnonymously();
      }
    });
  }

  Future<void> _initHasOpenRoute() async {
    final hasOpenRoute = await _routeRepository.routeExists(
      _authRepository.currentUser.id,
    );
    emit(state.copyWith(
      hasOpenRoute: hasOpenRoute,
    ));
  }

  Future<void> accept() async {
    await _persistentStorage.setIntroAccepted(true);
    emit(state.copyWith(
      isIntroAccepted: true,
    ));
  }
}
