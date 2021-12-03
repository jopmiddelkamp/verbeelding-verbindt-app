import '../../verbeelding_verbindt_core.dart';

abstract class LocaleRepository extends RepositoryBase {
  Future<IsoLanguageEntity?> getActiveIsoLanguage();
  Future<void> setActiveIsoLanguage(
    IsoLanguageEntity isoLanguage,
  );
}
