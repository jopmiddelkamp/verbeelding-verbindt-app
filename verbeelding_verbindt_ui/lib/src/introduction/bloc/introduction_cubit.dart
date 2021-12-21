import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class IntroductionCubit extends CubitBase<IntroductionState> {
  IntroductionCubit({
    required GetIsIntroAcceptedUseCase getIsIntroAcceptedUseCase,
    required AcceptIntroUseCase acceptIntroUseCase,
  })  : _getIsIntroAcceptedUseCase = getIsIntroAcceptedUseCase,
        _acceptIntroUseCase = acceptIntroUseCase,
        super(const IntroductionState.initializing());

  final GetIsIntroAcceptedUseCase _getIsIntroAcceptedUseCase;
  final AcceptIntroUseCase _acceptIntroUseCase;

  Future<void> init() async {
    emit(IntroductionState.loaded(
      accepted: await _getIsIntroAcceptedUseCase(null),
    ));
  }

  Future<void> accept() async {
    emit(IntroductionState.loaded(
      accepted: await _acceptIntroUseCase(null),
    ));
  }
}
