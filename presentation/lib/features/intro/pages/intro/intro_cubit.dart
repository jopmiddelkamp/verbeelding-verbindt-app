import '../../../../shared/bloc/cubit_base.dart';
import '../../../../shared/services/persistent_storage/persistent_storage_service.dart';
import 'intro_state.dart';

class IntroCubit extends CubitBase<IntroState> {
  IntroCubit({
    required PersistentStorageService persistentStorageService,
  })   : _persistentStorage = persistentStorageService,
        super(IntroState.initialize()) {
    _init();
  }

  final PersistentStorageService _persistentStorage;

  Future<void> _init() async {
    final isIntroAccepted = await _persistentStorage.getIsIntroAccepted();
    emit(IntroState.load(
      accepted: isIntroAccepted,
    ));
  }

  Future<void> accept() async {
    await _persistentStorage.setIntroAccepted(true);
    emit(IntroState.load(
      accepted: true,
    ));
  }
}
