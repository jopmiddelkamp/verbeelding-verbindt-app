import 'package:verbeelding_verbindt_core/entities/common/iso_language.dart';
import 'package:verbeelding_verbindt_core/repositories/locale_repository.dart';

import '../../persistent_storage/persistent_storage_repository.dart';

class PersistentStorageLocaleRepositoryImpl extends LocaleRepository {
  PersistentStorageLocaleRepositoryImpl({
    required this.persistentStorageRepository,
  });

  static const activeLocaleKey = 'activeLocale';

  final PersistentStorageRepository persistentStorageRepository;

  @override
  Future<IsoLanguageEntity?> getActiveIsoLanguage() async {
    final isoLanguageCode = await persistentStorageRepository.getString(
      activeLocaleKey,
    );
    if (isoLanguageCode == null) {
      return null;
    }
    try {
      return IsoLanguageEntity.fromIsoLanguageCode(isoLanguageCode);
    } on Exception {
      await persistentStorageRepository.remove(
        activeLocaleKey,
      );
      return null;
    }
  }

  @override
  Future<void> setActiveIsoLanguage(
    IsoLanguageEntity isoLanguage,
  ) {
    return persistentStorageRepository.setString(
      activeLocaleKey,
      isoLanguage.isoLanguageCode,
    );
  }
}
