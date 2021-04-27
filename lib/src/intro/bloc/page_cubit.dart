import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/services/barrel.dart';
import 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit({
    required PersistentStorageService persistentStorageService,
  })   : _persistentStorage = persistentStorageService,
        super(PageState.initialize()) {
    _init();
  }

  final PersistentStorageService _persistentStorage;

  Future<void> _init() async {
    final isIntroAccepted = await _persistentStorage.getIsIntroAccepted();
    emit(PageState.load(
      accepted: isIntroAccepted,
    ));
  }

  Future<void> accept() async {
    await _persistentStorage.setIntroAccepted(true);
    emit(PageState.load(
      accepted: true,
    ));
  }
}
