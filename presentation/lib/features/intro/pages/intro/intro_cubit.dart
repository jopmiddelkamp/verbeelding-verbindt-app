import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/repositories/page_content_repository.dart';
import 'package:verbeelding_verbindt_core/services/persistent_storage_service.dart';

import '../../../../shared/bloc/cubit_base.dart';
import 'intro_state.dart';

class IntroCubit extends CubitBase<IntroState> {
  IntroCubit({
    required PersistentStorageService persistentStorageService,
    required PageContentRepository pageContentRepository,
  })  : _persistentStorage = persistentStorageService,
        _pageContentRepository = pageContentRepository,
        super(IntroState.initialize()) {
    _init();
  }

  final PersistentStorageService _persistentStorage;
  final PageContentRepository _pageContentRepository;

  Future<void> _init() async {
    await _pageContentRepository
        .getIntroPageContent()
        .takeUntil(dispose$)
        .listen((pageContent) {
      // TODO: Handle no data found
      if (pageContent == null) {
        return;
      }
      emit(IntroState.load(
        content: pageContent,
      ));
    });
  }

  Future<void> accept() async {
    await _persistentStorage.setIntroAccepted(true);
    emit(state.copyWith(
      accepted: true,
    ));
  }
}
