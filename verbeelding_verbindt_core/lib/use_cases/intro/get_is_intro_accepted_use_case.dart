import '../../repositories/intro_repository.dart';
import '../use_case_base.dart';

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
