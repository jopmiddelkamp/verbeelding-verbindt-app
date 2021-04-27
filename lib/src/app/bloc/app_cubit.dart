import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/services/barrel.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required PersistentStorageService persistentStorageService,
  })   : _persistentStorage = persistentStorageService,
        super(AppState.initialize()) {
    _init();
  }

  final PersistentStorageService _persistentStorage;

  Future<void> _init() async {
    final isIntroAccepted = await _persistentStorage.getIsIntroAccepted();
    emit(AppState.load(
      introAccepted: isIntroAccepted,
    ));
  }

  Future<void> accept() async {
    await _persistentStorage.setIntroAccepted(true);
    emit(AppState.load(
      introAccepted: true,
    ));
  }
}
