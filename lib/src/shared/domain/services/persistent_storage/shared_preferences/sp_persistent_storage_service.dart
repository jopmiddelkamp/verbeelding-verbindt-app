import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/enums/permission_enum.dart';
import '../../../../domain/failures/persistent_storage/persistent_storage_failure.dart';
import '../../../../misc/utils/enum_utils.dart';
import '../../barrel.dart';
import '../../service_base.dart';

// PersistentStorageService implementation based on the SharedPreferences
// Flutter package
class SpPersistentStorageServiceImpl extends ServiceBase
    implements PersistentStorageService {
  SpPersistentStorageServiceImpl({
    required final SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  static const String introAcceptedKey = 'SP_INTRO_ACCEPTED';
  static const String lastLocationPermissionStatusKey =
      'SP_LAST_LOCATION_PERMISSION_STATUS';

  @override
  Future<bool> getIsIntroAccepted() async {
    final value = _sharedPreferences.get(
      introAcceptedKey,
    );
    if (value is! bool) {
      throw TypeMismatchPersistentStorageFailure(
        expectedType: bool,
        storageType: value.runtimeType,
      );
    }
    return value;
  }

  @override
  Future<void> setIntroAccepted(
    bool value,
  ) async {
    await _sharedPreferences.setBool(
      introAcceptedKey,
      value,
    );
  }

  @override
  Future<bool> getHasPermissionBeenRequested(
    Permission permission,
  ) async {
    final key = EnumUtils.getStringValue(permission);
    final value = _sharedPreferences.get(key);
    if (value is! bool?) {
      throw TypeMismatchPersistentStorageFailure(
        expectedType: bool,
        storageType: value.runtimeType,
      );
    }
    return value ?? false;
  }

  @override
  Future<void> setHasPermissionBeenRequested({
    required Permission permission,
  }) async {
    await _sharedPreferences.setBool(
      EnumUtils.getStringValue(permission),
      true,
    );
  }
}
