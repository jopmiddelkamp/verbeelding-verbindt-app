import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class IntroCubit extends CubitBase<IntroState> {
  IntroCubit({
    required GetIsIntroAcceptedUseCase getIsIntroAcceptedUseCase,
    required AcceptIntroUseCase acceptIntroUseCase,
  })  : _getIsIntroAcceptedUseCase = getIsIntroAcceptedUseCase,
        _acceptIntroUseCase = acceptIntroUseCase,
        super(const IntroState.initializing());

  final GetIsIntroAcceptedUseCase _getIsIntroAcceptedUseCase;
  final AcceptIntroUseCase _acceptIntroUseCase;

  Future<void> init() async {
    emit(IntroState.loaded(
      accepted: await _getIsIntroAcceptedUseCase(null),
    ));
  }

  Future<void> accept() async {
    emit(IntroState.loaded(
      accepted: await _acceptIntroUseCase(null),
    ));
  }
}
