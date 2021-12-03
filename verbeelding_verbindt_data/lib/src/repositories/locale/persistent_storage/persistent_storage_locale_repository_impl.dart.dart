import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_data.dart';

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
