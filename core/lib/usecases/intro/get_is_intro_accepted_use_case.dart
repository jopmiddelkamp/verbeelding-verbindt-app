import '../../repositories/intro_repository.dart';
import '../use_case_base.dart';

class GetIsIntroAcceptedUseCase extends UseCase<bool> {
  GetIsIntroAcceptedUseCase({
    required IntroRepository introRepository,
  }) : _introRepository = introRepository;

  final IntroRepository _introRepository;

  @override
  Future<bool> handle() {
    return _introRepository.getIntroAccepted();
  }
}
