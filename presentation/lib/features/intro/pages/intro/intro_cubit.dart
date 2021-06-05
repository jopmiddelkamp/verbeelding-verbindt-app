import 'package:verbeelding_verbindt_core/repositories/page_content_repository.dart';
import 'package:verbeelding_verbindt_core/services/persistent_storage_service.dart';

import '../../../../shared/bloc/cubit_base.dart';
import 'intro_state.dart';

class IntroCubit extends CubitBase<IntroState> {
  IntroCubit({
    required PersistentStorageService persistentStorageService,
    required PageContentRepository pageContentRepository,
  })  : _persistentStorage = persistentStorageService,
        super(IntroState.initialize());

  final PersistentStorageService _persistentStorage;

  Future<void> accept() async {
    await _persistentStorage.setIntroAccepted(true);
    emit(state.copyWith(
      accepted: true,
    ));
  }
}
