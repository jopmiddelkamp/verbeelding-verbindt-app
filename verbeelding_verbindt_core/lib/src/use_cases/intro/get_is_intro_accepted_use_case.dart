import '../../../verbeelding_verbindt_core.dart';

class GetIsIntroAcceptedUseCase extends UseCase<Future<bool>, void> {
  GetIsIntroAcceptedUseCase({
    required IntroRepository introRepository,
  }) : _introRepository = introRepository;

  final IntroRepository _introRepository;

  @override
  Future<bool> call(void params) {
    return _introRepository.getIntroAccepted();
  }
}

class StreamIsIntroAcceptedUseCase extends UseCase<Stream<bool>, void> {
  StreamIsIntroAcceptedUseCase({
    required IntroRepository introRepository,
  }) : _introRepository = introRepository;

  final IntroRepository _introRepository;

  @override
  Stream<bool> call(void params) {
    return _introRepository.streamIntroAccepted();
  }
}
