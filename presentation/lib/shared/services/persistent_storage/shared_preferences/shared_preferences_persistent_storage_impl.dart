import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/services/service_base.dart';
import 'package:verbeelding_verbindt_core/utils/enum_utils.dart';

import '../../../enums/permission_enum.dart';
import '../../../failures/persistent_storage/persistent_storage_failure.dart';
import '../persistent_storage_service.dart';

// PersistentStorageService implementation based on the SharedPreferences
// Flutter package
class SpPersistentStorageServiceImpl extends ServiceBase
    implements PersistentStorageService {
  SpPersistentStorageServiceImpl({
    required final SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  static const String introAcceptedKey = 'SP_INTRO_ACCEPTED';

  @override
  Future<bool> getIsIntroAccepted() async {
    final value = _sharedPreferences.get(
      introAcceptedKey,
    );
    if (value == null) {
      return false;
    }
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
    final value = _sharedPreferences.get(permission.toString());
    if (value == null) {
      return false;
    }
    if (value is! bool) {
      throw TypeMismatchPersistentStorageFailure(
        expectedType: bool,
        storageType: value.runtimeType,
      );
    }
    return value;
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
