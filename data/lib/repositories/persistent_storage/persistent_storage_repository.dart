import 'dart:async';

abstract class PersistentStorageRepository {
  /// Returns [String] object if successful or throws a
  /// [TypeMismatchFailure] if the object is not of type
  /// [String].
  Future<String?> getString(
    String key,
  );

  /// Returns [String] object if successful or else return the [orElse]
  /// argument. Will throw a [TypeMismatchFailure] if value is
  /// not of type [String].
  Future<String> getStringOrElse(
    String key, {
    required String orElse,
  });

  /// Stores the [String] value
  Future<void> setString(
    String key,
    String value,
  );

  /// Returns [bool] object if successful or throws a
  /// [TypeMismatchFailure] if the object is not of type
  /// [bool].
  Future<bool?> getBool(
    String key,
  );

  /// Returns [bool] object if successful or else return the [orElse]
  /// argument. Will throw a [TypeMismatchFailure] if value is
  /// not of type [bool].
  Future<bool> getBoolOrElse(
    String key, {
    required bool orElse,
  });

  /// Stores the [bool] value
  Future<void> setBool(
    String key,
    // ignore: avoid_positional_boolean_parameters
    bool value,
  );

  /// Returns [int] object if successful or throws a
  /// [TypeMismatchFailure] if the object is not of type
  /// [String].
  Future<int?> getInt(
    String key,
  );

  /// Returns [int] object if successful or else return the [orElse]
  /// argument. Will throw a [TypeMismatchFailure] if value is
  /// not of type [int].
  Future<int> getIntOrElse(
    String key, {
    required int orElse,
  });

  /// Stores the [int] value
  Future<void> setInt(
    String key,
    int value,
  );

  /// Removes the value stored under the [key].
  Future<bool> remove(
    String key,
  );

  /// Returns [true] if the key has been found. If not returns [false].
  Future<bool> containsKey(
    String key,
  );
}
