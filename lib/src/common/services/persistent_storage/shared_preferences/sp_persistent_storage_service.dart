import 'dart:async';
import 'dart:html';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../enums/permission_enum.dart';
import '../../../enums/permission_status_enum.dart';
import '../../../utils/enum_utils.dart';
import '../../barrel.dart';
import '../../service_base.dart';

// PersistentStorageService implementation based on the SharedPreferences
// Flutter package
class SpPersistentStorageServiceImpl extends ServiceBase
    implements PersistentStorageService {
  SpPersistentStorageServiceImpl({
    required final SharedPreferences sharedPreferences,
  }) : _sp = sharedPreferences;

  final SharedPreferences _sp;

  static const String introAcceptedKey = 'SP_INTRO_ACCEPTED';
  static const String lastLocationPermissionStatusKey =
      'SP_LAST_LOCATION_PERMISSION_STATUS';

  @override
  Future<bool> getIsIntroAccepted() async {
    final intoPassed = _sp.getBool(
      introAcceptedKey,
    );
    return intoPassed ?? false;
  }

  @override
  Future<void> setIntroAccepted(
    bool value,
  ) async {
    await _sp.setBool(
      introAcceptedKey,
      value,
    );
  }

  @override
  Future<PermissionStatus> getLatestPermissionStatus(
    Permission permission,
  ) async {
    final defaultValue = PermissionStatus.undetermined;
    final statusAsString = _sp.getString(
      EnumUtils.getStringValue(permission),
    );
    if (statusAsString == null) {
      return defaultValue;
    }
    return EnumUtils.enumFromString(
      PermissionStatus.values,
      statusAsString,
      defaultValue: defaultValue,
    );
  }

  @override
  Future<void> setLatestPermissionStatus({
    required Permission permission,
    required PermissionStatus status,
  }) async {
    await _sp.setString(
      EnumUtils.getStringValue(permission),
      EnumUtils.getStringValue(status),
    );
  }
}
