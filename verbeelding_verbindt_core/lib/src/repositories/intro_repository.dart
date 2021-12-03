import '../../verbeelding_verbindt_core.dart';

abstract class IntroRepository extends RepositoryBase {
  Future<void> setIntroAccepted({
    required bool value,
  });
  Future<bool> getIntroAccepted();
}
