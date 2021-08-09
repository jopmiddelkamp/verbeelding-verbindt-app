// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'intro_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IntroStateTearOff {
  const _$IntroStateTearOff();

  IntroInitializing initializing() {
    return const IntroInitializing();
  }

  IntroLoaded loaded({required bool accepted}) {
    return IntroLoaded(
      accepted: accepted,
    );
  }

  IntroFailure failed([Failure? failure]) {
    return IntroFailure(
      failure,
    );
  }
}

/// @nodoc
const $IntroState = _$IntroStateTearOff();

/// @nodoc
mixin _$IntroState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(bool accepted) loaded,
    required TResult Function(Failure? failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(bool accepted)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntroInitializing value) initializing,
    required TResult Function(IntroLoaded value) loaded,
    required TResult Function(IntroFailure value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntroInitializing value)? initializing,
    TResult Function(IntroLoaded value)? loaded,
    TResult Function(IntroFailure value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroStateCopyWith<$Res> {
  factory $IntroStateCopyWith(
          IntroState value, $Res Function(IntroState) then) =
      _$IntroStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$IntroStateCopyWithImpl<$Res> implements $IntroStateCopyWith<$Res> {
  _$IntroStateCopyWithImpl(this._value, this._then);

  final IntroState _value;
  // ignore: unused_field
  final $Res Function(IntroState) _then;
}

/// @nodoc
abstract class $IntroInitializingCopyWith<$Res> {
  factory $IntroInitializingCopyWith(
          IntroInitializing value, $Res Function(IntroInitializing) then) =
      _$IntroInitializingCopyWithImpl<$Res>;
}

/// @nodoc
class _$IntroInitializingCopyWithImpl<$Res>
    extends _$IntroStateCopyWithImpl<$Res>
    implements $IntroInitializingCopyWith<$Res> {
  _$IntroInitializingCopyWithImpl(
      IntroInitializing _value, $Res Function(IntroInitializing) _then)
      : super(_value, (v) => _then(v as IntroInitializing));

  @override
  IntroInitializing get _value => super._value as IntroInitializing;
}

/// @nodoc
class _$IntroInitializing implements IntroInitializing {
  const _$IntroInitializing();

  @override
  String toString() {
    return 'IntroState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is IntroInitializing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(bool accepted) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(bool accepted)? loaded,
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
    required TResult Function(IntroInitializing value) initializing,
    required TResult Function(IntroLoaded value) loaded,
    required TResult Function(IntroFailure value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntroInitializing value)? initializing,
    TResult Function(IntroLoaded value)? loaded,
    TResult Function(IntroFailure value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class IntroInitializing implements IntroState {
  const factory IntroInitializing() = _$IntroInitializing;
}

/// @nodoc
abstract class $IntroLoadedCopyWith<$Res> {
  factory $IntroLoadedCopyWith(
          IntroLoaded value, $Res Function(IntroLoaded) then) =
      _$IntroLoadedCopyWithImpl<$Res>;
  $Res call({bool accepted});
}

/// @nodoc
class _$IntroLoadedCopyWithImpl<$Res> extends _$IntroStateCopyWithImpl<$Res>
    implements $IntroLoadedCopyWith<$Res> {
  _$IntroLoadedCopyWithImpl(
      IntroLoaded _value, $Res Function(IntroLoaded) _then)
      : super(_value, (v) => _then(v as IntroLoaded));

  @override
  IntroLoaded get _value => super._value as IntroLoaded;

  @override
  $Res call({
    Object? accepted = freezed,
  }) {
    return _then(IntroLoaded(
      accepted: accepted == freezed
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$IntroLoaded implements IntroLoaded {
  const _$IntroLoaded({required this.accepted});

  @override
  final bool accepted;

  @override
  String toString() {
    return 'IntroState.loaded(accepted: $accepted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IntroLoaded &&
            (identical(other.accepted, accepted) ||
                const DeepCollectionEquality()
                    .equals(other.accepted, accepted)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(accepted);

  @JsonKey(ignore: true)
  @override
  $IntroLoadedCopyWith<IntroLoaded> get copyWith =>
      _$IntroLoadedCopyWithImpl<IntroLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(bool accepted) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return loaded(accepted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(bool accepted)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(accepted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IntroInitializing value) initializing,
    required TResult Function(IntroLoaded value) loaded,
    required TResult Function(IntroFailure value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntroInitializing value)? initializing,
    TResult Function(IntroLoaded value)? loaded,
    TResult Function(IntroFailure value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class IntroLoaded implements IntroState {
  const factory IntroLoaded({required bool accepted}) = _$IntroLoaded;

  bool get accepted => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IntroLoadedCopyWith<IntroLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroFailureCopyWith<$Res> {
  factory $IntroFailureCopyWith(
          IntroFailure value, $Res Function(IntroFailure) then) =
      _$IntroFailureCopyWithImpl<$Res>;
  $Res call({Failure? failure});
}

/// @nodoc
class _$IntroFailureCopyWithImpl<$Res> extends _$IntroStateCopyWithImpl<$Res>
    implements $IntroFailureCopyWith<$Res> {
  _$IntroFailureCopyWithImpl(
      IntroFailure _value, $Res Function(IntroFailure) _then)
      : super(_value, (v) => _then(v as IntroFailure));

  @override
  IntroFailure get _value => super._value as IntroFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(IntroFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc
class _$IntroFailure implements IntroFailure {
  const _$IntroFailure([this.failure]);

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'IntroState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IntroFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $IntroFailureCopyWith<IntroFailure> get copyWith =>
      _$IntroFailureCopyWithImpl<IntroFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(bool accepted) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(bool accepted)? loaded,
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
    required TResult Function(IntroInitializing value) initializing,
    required TResult Function(IntroLoaded value) loaded,
    required TResult Function(IntroFailure value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IntroInitializing value)? initializing,
    TResult Function(IntroLoaded value)? loaded,
    TResult Function(IntroFailure value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class IntroFailure implements IntroState {
  const factory IntroFailure([Failure? failure]) = _$IntroFailure;

  Failure? get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IntroFailureCopyWith<IntroFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
