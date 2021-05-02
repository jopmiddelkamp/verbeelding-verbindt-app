import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/services/persistent_storage_service.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required PersistentStorageService persistentStorageService,
    required GlobalKey<NavigatorState> navigatorKey,
  })   : _persistentStorage = persistentStorageService,
        super(AppState.initialize(navigatorKey)) {
    _init();
  }

  final PersistentStorageService _persistentStorage;

  Future<void> _init() async {
    final isIntroAccepted = await _persistentStorage.getIsIntroAccepted();
    emit(state.copyWith(
      introAccepted: isIntroAccepted,
    ));
  }

  Future<void> accept() async {
    await _persistentStorage.setIntroAccepted(true);
    emit(state.copyWith(
      introAccepted: true,
    ));
  }
}
