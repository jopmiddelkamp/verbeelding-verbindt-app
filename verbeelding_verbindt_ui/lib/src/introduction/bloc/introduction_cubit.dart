import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class IntroductionCubit extends CubitBase<IntroductionState> {
  IntroductionCubit({
    required GetIsIntroAcceptedUseCase getIsIntroAcceptedUseCase,
    required AcceptIntroUseCase acceptIntroUseCase,
  })  : _getIsIntroAccepted = getIsIntroAcceptedUseCase,
        _acceptIntro = acceptIntroUseCase,
        super(const IntroductionState.initializing());

  final GetIsIntroAcceptedUseCase _getIsIntroAccepted;
  final AcceptIntroUseCase _acceptIntro;

  Future<void> init() async {
    emit(IntroductionState.loaded(
      accepted: await _getIsIntroAccepted(null),
    ));
  }

  Future<void> accept() async {
    emit(IntroductionState.loaded(
      accepted: await _acceptIntro(null),
    ));
  }
}
