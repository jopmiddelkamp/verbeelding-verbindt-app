import '../entities/iso_language.dart';
import 'repository_base.dart';

abstract class LocaleRepository extends RepositoryBase {
  Future<IsoLanguageEntity?> getActiveIsoLanguage();
  Future<void> setActiveIsoLanguage(
    IsoLanguageEntity isoLanguage,
  );
}
