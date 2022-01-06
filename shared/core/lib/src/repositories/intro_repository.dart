abstract class IntroRepository {
  Future<void> setIntroAccepted({
    required bool value,
  });
  Stream<bool> streamIntroAccepted();
  Future<bool> getIntroAccepted();
}
