import '../../../verbeelding_verbindt_core.dart';

class GetIsIntroAcceptedUseCase extends UseCase<bool, void> {
  GetIsIntroAcceptedUseCase({
    required IntroRepository introRepository,
  }) : _introRepository = introRepository;

  final IntroRepository _introRepository;

  @override
  Future<bool> call(
    void argument,
  ) {
    return _introRepository.getIntroAccepted();
  }
}
