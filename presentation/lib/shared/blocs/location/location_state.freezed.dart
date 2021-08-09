// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationStateTearOff {
  const _$LocationStateTearOff();

  InitializingLocationState initializing() {
    return const InitializingLocationState();
  }

  LoadedLocationState loaded({required LocationEntity location}) {
    return LoadedLocationState(
      location: location,
    );
  }

  FailureLocationState failed([Failure? failure]) {
    return FailureLocationState(
      failure,
    );
  }
}

/// @nodoc
const $LocationState = _$LocationStateTearOff();

/// @nodoc
mixin _$LocationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(LocationEntity location) loaded,
    required TResult Function(Failure? failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(LocationEntity location)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializingLocationState value) initializing,
    required TResult Function(LoadedLocationState value) loaded,
    required TResult Function(FailureLocationState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingLocationState value)? initializing,
    TResult Function(LoadedLocationState value)? loaded,
    TResult Function(FailureLocationState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  final LocationState _value;
  // ignore: unused_field
  final $Res Function(LocationState) _then;
}

/// @nodoc
abstract class $InitializingLocationStateCopyWith<$Res> {
  factory $InitializingLocationStateCopyWith(InitializingLocationState value,
          $Res Function(InitializingLocationState) then) =
      _$InitializingLocationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializingLocationStateCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $InitializingLocationStateCopyWith<$Res> {
  _$InitializingLocationStateCopyWithImpl(InitializingLocationState _value,
      $Res Function(InitializingLocationState) _then)
      : super(_value, (v) => _then(v as InitializingLocationState));

  @override
  InitializingLocationState get _value =>
      super._value as InitializingLocationState;
}

/// @nodoc
class _$InitializingLocationState implements InitializingLocationState {
  const _$InitializingLocationState();

  @override
  String toString() {
    return 'LocationState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializingLocationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(LocationEntity location) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(LocationEntity location)? loaded,
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
    required TResult Function(InitializingLocationState value) initializing,
    required TResult Function(LoadedLocationState value) loaded,
    required TResult Function(FailureLocationState value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingLocationState value)? initializing,
    TResult Function(LoadedLocationState value)? loaded,
    TResult Function(FailureLocationState value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class InitializingLocationState implements LocationState {
  const factory InitializingLocationState() = _$InitializingLocationState;
}

/// @nodoc
abstract class $LoadedLocationStateCopyWith<$Res> {
  factory $LoadedLocationStateCopyWith(
          LoadedLocationState value, $Res Function(LoadedLocationState) then) =
      _$LoadedLocationStateCopyWithImpl<$Res>;
  $Res call({LocationEntity location});
}

/// @nodoc
class _$LoadedLocationStateCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $LoadedLocationStateCopyWith<$Res> {
  _$LoadedLocationStateCopyWithImpl(
      LoadedLocationState _value, $Res Function(LoadedLocationState) _then)
      : super(_value, (v) => _then(v as LoadedLocationState));

  @override
  LoadedLocationState get _value => super._value as LoadedLocationState;

  @override
  $Res call({
    Object? location = freezed,
  }) {
    return _then(LoadedLocationState(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationEntity,
    ));
  }
}

/// @nodoc
class _$LoadedLocationState implements LoadedLocationState {
  const _$LoadedLocationState({required this.location});

  @override
  final LocationEntity location;

  @override
  String toString() {
    return 'LocationState.loaded(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedLocationState &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @JsonKey(ignore: true)
  @override
  $LoadedLocationStateCopyWith<LoadedLocationState> get copyWith =>
      _$LoadedLocationStateCopyWithImpl<LoadedLocationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(LocationEntity location) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return loaded(location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(LocationEntity location)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializingLocationState value) initializing,
    required TResult Function(LoadedLocationState value) loaded,
    required TResult Function(FailureLocationState value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingLocationState value)? initializing,
    TResult Function(LoadedLocationState value)? loaded,
    TResult Function(FailureLocationState value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedLocationState implements LocationState {
  const factory LoadedLocationState({required LocationEntity location}) =
      _$LoadedLocationState;

  LocationEntity get location => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedLocationStateCopyWith<LoadedLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureLocationStateCopyWith<$Res> {
  factory $FailureLocationStateCopyWith(FailureLocationState value,
          $Res Function(FailureLocationState) then) =
      _$FailureLocationStateCopyWithImpl<$Res>;
  $Res call({Failure? failure});
}

/// @nodoc
class _$FailureLocationStateCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $FailureLocationStateCopyWith<$Res> {
  _$FailureLocationStateCopyWithImpl(
      FailureLocationState _value, $Res Function(FailureLocationState) _then)
      : super(_value, (v) => _then(v as FailureLocationState));

  @override
  FailureLocationState get _value => super._value as FailureLocationState;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(FailureLocationState(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc
class _$FailureLocationState implements FailureLocationState {
  const _$FailureLocationState([this.failure]);

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'LocationState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FailureLocationState &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $FailureLocationStateCopyWith<FailureLocationState> get copyWith =>
      _$FailureLocationStateCopyWithImpl<FailureLocationState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(LocationEntity location) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(LocationEntity location)? loaded,
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
    required TResult Function(InitializingLocationState value) initializing,
    required TResult Function(LoadedLocationState value) loaded,
    required TResult Function(FailureLocationState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingLocationState value)? initializing,
    TResult Function(LoadedLocationState value)? loaded,
    TResult Function(FailureLocationState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FailureLocationState implements LocationState {
  const factory FailureLocationState([Failure? failure]) =
      _$FailureLocationState;

  Failure? get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailureLocationStateCopyWith<FailureLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}
