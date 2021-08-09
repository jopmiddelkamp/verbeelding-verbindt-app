import 'package:verbeelding_verbindt_core/repositories/intro_repository.dart';

import '../../persistent_storage/persistent_storage_repository.dart';

class PersistentStorageIntroRepositoryImpl extends IntroRepository {
  PersistentStorageIntroRepositoryImpl({
    required this.persistentStorageRepository,
  });

  static const acceptedKey = 'introAccepted';

  final PersistentStorageRepository persistentStorageRepository;

  @override
  Future<void> setIntroAccepted({
    required bool value,
  }) {
    return persistentStorageRepository.setBool(
      acceptedKey,
      value,
    );
  }

  @override
  Future<bool> getIntroAccepted() {
    return persistentStorageRepository.getBoolOrElse(
      acceptedKey,
      orElse: false,
    );
  }
}
