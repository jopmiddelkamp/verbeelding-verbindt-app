import '../../repositories/intro_repository.dart';
import '../use_case_base.dart';

class AcceptIntroUseCase extends UseCase<bool, void> {
  AcceptIntroUseCase({
    required IntroRepository introRepository,
  }) : _introRepository = introRepository;

  final IntroRepository _introRepository;

  @override
  Future<bool> call(
    void argument,
  ) async {
    const accepted = true;
    await _introRepository.setIntroAccepted(
      value: accepted,
    );
    return accepted;
  }
}
