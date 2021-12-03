import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_data.dart';

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
