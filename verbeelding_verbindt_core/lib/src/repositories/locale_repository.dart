import '../../verbeelding_verbindt_core.dart';

abstract class LocaleRepository {
  Stream<IsoLanguage?> streamActiveIsoLanguage();
  Future<IsoLanguage?> getActiveIsoLanguage();
  Future<void> setActiveIsoLanguage(
    IsoLanguage isoLanguage,
  );
}
