import '../../verbeelding_verbindt_core.dart';

abstract class LocaleRepository extends RepositoryBase {
  Future<IsoLanguageGeoLocation?> getActiveIsoLanguage();
  Future<void> setActiveIsoLanguage(
    IsoLanguageGeoLocation isoLanguage,
  );
}
