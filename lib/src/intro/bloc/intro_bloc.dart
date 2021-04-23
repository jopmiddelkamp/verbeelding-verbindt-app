import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/services/barrel.dart';
import 'intro_state.dart';

class IntroBloc extends Cubit<IntroState> {
  IntroBloc({
    required PersistentStorageService persistentStorageService,
  })   : _ps = persistentStorageService,
        super(const Initializing()) {
    _init();
  }

  final PersistentStorageService _ps;

  Future<void> _init() async {
    final isIntroAccepted = await _ps.getIsIntroAccepted();
    if (isIntroAccepted) {
      emit(const Accepted());
    } else {
      emit(const Loaded());
    }
  }

  Future<void> accept() async {
    await _ps.setIntroAccepted(true);
    emit(const Accepted());
  }
}
