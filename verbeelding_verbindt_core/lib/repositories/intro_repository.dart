import 'repository_base.dart';

abstract class IntroRepository extends RepositoryBase {
  Future<void> setIntroAccepted({
    required bool value,
  });
  Future<bool> getIntroAccepted();
}
