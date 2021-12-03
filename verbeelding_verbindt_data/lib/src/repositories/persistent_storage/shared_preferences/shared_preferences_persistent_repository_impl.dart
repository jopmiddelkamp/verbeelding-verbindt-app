import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../../../verbeelding_verbindt_data.dart';

/// [PersistentStorageRepository] implementation based on the [SharedPreferences]
/// Flutter package
class SpPersistentStorageRepositoryImpl extends RepositoryBase
    implements PersistentStorageRepository {
  SpPersistentStorageRepositoryImpl({
    required final SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Future<String?> getString(
    String key,
  ) async {
    try {
      return _sharedPreferences.getString(key);
    } on Exception {
      throw const TypeMismatchFailure();
    }
  }

  @override
  Future<String> getStringOrElse(
    String key, {
    required String orElse,
  }) async {
    final value = await getString(key);
    return value ?? orElse;
  }

  @override
  Future<void> setString(
    String key,
    String value,
  ) async {
    await _sharedPreferences.setString(
      key,
      value,
    );
  }

  @override
  Future<bool> containsKey(
    String key,
  ) async {
    return _sharedPreferences.containsKey(key);
  }

  @override
  Future<bool> remove(
    String key,
  ) async {
    return await _sharedPreferences.remove(key);
  }

  @override
  Future<bool?> getBool(
    String key,
  ) async {
    try {
      return _sharedPreferences.getBool(key);
    } on Exception {
      throw const TypeMismatchFailure();
    }
  }

  @override
  Future<bool> getBoolOrElse(
    String key, {
    required bool orElse,
  }) async {
    final value = await getBool(key);
    return value ?? orElse;
  }

  @override
  Future<void> setBool(
    String key,
    bool value,
  ) async {
    await _sharedPreferences.setBool(
      key,
      value,
    );
  }

  @override
  Future<int?> getInt(
    String key,
  ) async {
    try {
      return _sharedPreferences.getInt(key);
    } on Exception {
      throw const TypeMismatchFailure();
    }
  }

  @override
  Future<int> getIntOrElse(
    String key, {
    required int orElse,
  }) async {
    final value = await getInt(key);
    return value ?? orElse;
  }

  @override
  Future<void> setInt(
    String key,
    int value,
  ) async {
    await _sharedPreferences.setInt(
      key,
      value,
    );
  }
}
