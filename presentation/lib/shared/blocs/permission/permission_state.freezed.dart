// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'permission_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PermissionStateTearOff {
  const _$PermissionStateTearOff();

  PermissionInitializing initializing() {
    return const PermissionInitializing();
  }

  PermissionLoaded loaded({required PermissionStatus locationWhenInUseStatus}) {
    return PermissionLoaded(
      locationWhenInUseStatus: locationWhenInUseStatus,
    );
  }

  PermissionFailure failed([Failure? failure]) {
    return PermissionFailure(
      failure,
    );
  }
}

/// @nodoc
const $PermissionState = _$PermissionStateTearOff();

/// @nodoc
mixin _$PermissionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(PermissionStatus locationWhenInUseStatus) loaded,
    required TResult Function(Failure? failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(PermissionStatus locationWhenInUseStatus)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionInitializing value) initializing,
    required TResult Function(PermissionLoaded value) loaded,
    required TResult Function(PermissionFailure value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionInitializing value)? initializing,
    TResult Function(PermissionLoaded value)? loaded,
    TResult Function(PermissionFailure value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionStateCopyWith<$Res> {
  factory $PermissionStateCopyWith(
          PermissionState value, $Res Function(PermissionState) then) =
      _$PermissionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PermissionStateCopyWithImpl<$Res>
    implements $PermissionStateCopyWith<$Res> {
  _$PermissionStateCopyWithImpl(this._value, this._then);

  final PermissionState _value;
  // ignore: unused_field
  final $Res Function(PermissionState) _then;
}

/// @nodoc
abstract class $PermissionInitializingCopyWith<$Res> {
  factory $PermissionInitializingCopyWith(PermissionInitializing value,
          $Res Function(PermissionInitializing) then) =
      _$PermissionInitializingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PermissionInitializingCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res>
    implements $PermissionInitializingCopyWith<$Res> {
  _$PermissionInitializingCopyWithImpl(PermissionInitializing _value,
      $Res Function(PermissionInitializing) _then)
      : super(_value, (v) => _then(v as PermissionInitializing));

  @override
  PermissionInitializing get _value => super._value as PermissionInitializing;
}

/// @nodoc
class _$PermissionInitializing implements PermissionInitializing {
  const _$PermissionInitializing();

  @override
  String toString() {
    return 'PermissionState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PermissionInitializing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(PermissionStatus locationWhenInUseStatus) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(PermissionStatus locationWhenInUseStatus)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionInitializing value) initializing,
    required TResult Function(PermissionLoaded value) loaded,
    required TResult Function(PermissionFailure value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionInitializing value)? initializing,
    TResult Function(PermissionLoaded value)? loaded,
    TResult Function(PermissionFailure value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class PermissionInitializing implements PermissionState {
  const factory PermissionInitializing() = _$PermissionInitializing;
}

/// @nodoc
abstract class $PermissionLoadedCopyWith<$Res> {
  factory $PermissionLoadedCopyWith(
          PermissionLoaded value, $Res Function(PermissionLoaded) then) =
      _$PermissionLoadedCopyWithImpl<$Res>;
  $Res call({PermissionStatus locationWhenInUseStatus});
}

/// @nodoc
class _$PermissionLoadedCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res>
    implements $PermissionLoadedCopyWith<$Res> {
  _$PermissionLoadedCopyWithImpl(
      PermissionLoaded _value, $Res Function(PermissionLoaded) _then)
      : super(_value, (v) => _then(v as PermissionLoaded));

  @override
  PermissionLoaded get _value => super._value as PermissionLoaded;

  @override
  $Res call({
    Object? locationWhenInUseStatus = freezed,
  }) {
    return _then(PermissionLoaded(
      locationWhenInUseStatus: locationWhenInUseStatus == freezed
          ? _value.locationWhenInUseStatus
          : locationWhenInUseStatus // ignore: cast_nullable_to_non_nullable
              as PermissionStatus,
    ));
  }
}

/// @nodoc
class _$PermissionLoaded implements PermissionLoaded {
  const _$PermissionLoaded({required this.locationWhenInUseStatus});

  @override
  final PermissionStatus locationWhenInUseStatus;

  @override
  String toString() {
    return 'PermissionState.loaded(locationWhenInUseStatus: $locationWhenInUseStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PermissionLoaded &&
            (identical(
                    other.locationWhenInUseStatus, locationWhenInUseStatus) ||
                const DeepCollectionEquality().equals(
                    other.locationWhenInUseStatus, locationWhenInUseStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(locationWhenInUseStatus);

  @JsonKey(ignore: true)
  @override
  $PermissionLoadedCopyWith<PermissionLoaded> get copyWith =>
      _$PermissionLoadedCopyWithImpl<PermissionLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(PermissionStatus locationWhenInUseStatus) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return loaded(locationWhenInUseStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(PermissionStatus locationWhenInUseStatus)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(locationWhenInUseStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionInitializing value) initializing,
    required TResult Function(PermissionLoaded value) loaded,
    required TResult Function(PermissionFailure value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionInitializing value)? initializing,
    TResult Function(PermissionLoaded value)? loaded,
    TResult Function(PermissionFailure value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PermissionLoaded implements PermissionState {
  const factory PermissionLoaded(
      {required PermissionStatus locationWhenInUseStatus}) = _$PermissionLoaded;

  PermissionStatus get locationWhenInUseStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionLoadedCopyWith<PermissionLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionFailureCopyWith<$Res> {
  factory $PermissionFailureCopyWith(
          PermissionFailure value, $Res Function(PermissionFailure) then) =
      _$PermissionFailureCopyWithImpl<$Res>;
  $Res call({Failure? failure});
}

/// @nodoc
class _$PermissionFailureCopyWithImpl<$Res>
    extends _$PermissionStateCopyWithImpl<$Res>
    implements $PermissionFailureCopyWith<$Res> {
  _$PermissionFailureCopyWithImpl(
      PermissionFailure _value, $Res Function(PermissionFailure) _then)
      : super(_value, (v) => _then(v as PermissionFailure));

  @override
  PermissionFailure get _value => super._value as PermissionFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(PermissionFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc
class _$PermissionFailure implements PermissionFailure {
  const _$PermissionFailure([this.failure]);

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'PermissionState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PermissionFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $PermissionFailureCopyWith<PermissionFailure> get copyWith =>
      _$PermissionFailureCopyWithImpl<PermissionFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(PermissionStatus locationWhenInUseStatus) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(PermissionStatus locationWhenInUseStatus)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PermissionInitializing value) initializing,
    required TResult Function(PermissionLoaded value) loaded,
    required TResult Function(PermissionFailure value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PermissionInitializing value)? initializing,
    TResult Function(PermissionLoaded value)? loaded,
    TResult Function(PermissionFailure value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class PermissionFailure implements PermissionState {
  const factory PermissionFailure([Failure? failure]) = _$PermissionFailure;

  Failure? get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionFailureCopyWith<PermissionFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
