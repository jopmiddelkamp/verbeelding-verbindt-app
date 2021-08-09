// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'button_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ButtonStateTearOff {
  const _$ButtonStateTearOff();

  ButtonInitializing initializing() {
    return const ButtonInitializing();
  }

  ButtonIdle idle() {
    return const ButtonIdle();
  }

  ButtonBusy busy() {
    return const ButtonBusy();
  }

  ButtonFailure failed([Failure? failure]) {
    return ButtonFailure(
      failure,
    );
  }
}

/// @nodoc
const $ButtonState = _$ButtonStateTearOff();

/// @nodoc
mixin _$ButtonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() idle,
    required TResult Function() busy,
    required TResult Function(Failure? failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? idle,
    TResult Function()? busy,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ButtonInitializing value) initializing,
    required TResult Function(ButtonIdle value) idle,
    required TResult Function(ButtonBusy value) busy,
    required TResult Function(ButtonFailure value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ButtonInitializing value)? initializing,
    TResult Function(ButtonIdle value)? idle,
    TResult Function(ButtonBusy value)? busy,
    TResult Function(ButtonFailure value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ButtonStateCopyWith<$Res> {
  factory $ButtonStateCopyWith(
          ButtonState value, $Res Function(ButtonState) then) =
      _$ButtonStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ButtonStateCopyWithImpl<$Res> implements $ButtonStateCopyWith<$Res> {
  _$ButtonStateCopyWithImpl(this._value, this._then);

  final ButtonState _value;
  // ignore: unused_field
  final $Res Function(ButtonState) _then;
}

/// @nodoc
abstract class $ButtonInitializingCopyWith<$Res> {
  factory $ButtonInitializingCopyWith(
          ButtonInitializing value, $Res Function(ButtonInitializing) then) =
      _$ButtonInitializingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ButtonInitializingCopyWithImpl<$Res>
    extends _$ButtonStateCopyWithImpl<$Res>
    implements $ButtonInitializingCopyWith<$Res> {
  _$ButtonInitializingCopyWithImpl(
      ButtonInitializing _value, $Res Function(ButtonInitializing) _then)
      : super(_value, (v) => _then(v as ButtonInitializing));

  @override
  ButtonInitializing get _value => super._value as ButtonInitializing;
}

/// @nodoc
class _$ButtonInitializing implements ButtonInitializing {
  const _$ButtonInitializing();

  @override
  String toString() {
    return 'ButtonState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ButtonInitializing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() idle,
    required TResult Function() busy,
    required TResult Function(Failure? failure) failed,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? idle,
    TResult Function()? busy,
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
    required TResult Function(ButtonInitializing value) initializing,
    required TResult Function(ButtonIdle value) idle,
    required TResult Function(ButtonBusy value) busy,
    required TResult Function(ButtonFailure value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ButtonInitializing value)? initializing,
    TResult Function(ButtonIdle value)? idle,
    TResult Function(ButtonBusy value)? busy,
    TResult Function(ButtonFailure value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class ButtonInitializing implements ButtonState {
  const factory ButtonInitializing() = _$ButtonInitializing;
}

/// @nodoc
abstract class $ButtonIdleCopyWith<$Res> {
  factory $ButtonIdleCopyWith(
          ButtonIdle value, $Res Function(ButtonIdle) then) =
      _$ButtonIdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$ButtonIdleCopyWithImpl<$Res> extends _$ButtonStateCopyWithImpl<$Res>
    implements $ButtonIdleCopyWith<$Res> {
  _$ButtonIdleCopyWithImpl(ButtonIdle _value, $Res Function(ButtonIdle) _then)
      : super(_value, (v) => _then(v as ButtonIdle));

  @override
  ButtonIdle get _value => super._value as ButtonIdle;
}

/// @nodoc
class _$ButtonIdle implements ButtonIdle {
  const _$ButtonIdle();

  @override
  String toString() {
    return 'ButtonState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ButtonIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() idle,
    required TResult Function() busy,
    required TResult Function(Failure? failure) failed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? idle,
    TResult Function()? busy,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ButtonInitializing value) initializing,
    required TResult Function(ButtonIdle value) idle,
    required TResult Function(ButtonBusy value) busy,
    required TResult Function(ButtonFailure value) failed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ButtonInitializing value)? initializing,
    TResult Function(ButtonIdle value)? idle,
    TResult Function(ButtonBusy value)? busy,
    TResult Function(ButtonFailure value)? failed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ButtonIdle implements ButtonState {
  const factory ButtonIdle() = _$ButtonIdle;
}

/// @nodoc
abstract class $ButtonBusyCopyWith<$Res> {
  factory $ButtonBusyCopyWith(
          ButtonBusy value, $Res Function(ButtonBusy) then) =
      _$ButtonBusyCopyWithImpl<$Res>;
}

/// @nodoc
class _$ButtonBusyCopyWithImpl<$Res> extends _$ButtonStateCopyWithImpl<$Res>
    implements $ButtonBusyCopyWith<$Res> {
  _$ButtonBusyCopyWithImpl(ButtonBusy _value, $Res Function(ButtonBusy) _then)
      : super(_value, (v) => _then(v as ButtonBusy));

  @override
  ButtonBusy get _value => super._value as ButtonBusy;
}

/// @nodoc
class _$ButtonBusy implements ButtonBusy {
  const _$ButtonBusy();

  @override
  String toString() {
    return 'ButtonState.busy()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ButtonBusy);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() idle,
    required TResult Function() busy,
    required TResult Function(Failure? failure) failed,
  }) {
    return busy();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? idle,
    TResult Function()? busy,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) {
    if (busy != null) {
      return busy();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ButtonInitializing value) initializing,
    required TResult Function(ButtonIdle value) idle,
    required TResult Function(ButtonBusy value) busy,
    required TResult Function(ButtonFailure value) failed,
  }) {
    return busy(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ButtonInitializing value)? initializing,
    TResult Function(ButtonIdle value)? idle,
    TResult Function(ButtonBusy value)? busy,
    TResult Function(ButtonFailure value)? failed,
    required TResult orElse(),
  }) {
    if (busy != null) {
      return busy(this);
    }
    return orElse();
  }
}

abstract class ButtonBusy implements ButtonState {
  const factory ButtonBusy() = _$ButtonBusy;
}

/// @nodoc
abstract class $ButtonFailureCopyWith<$Res> {
  factory $ButtonFailureCopyWith(
          ButtonFailure value, $Res Function(ButtonFailure) then) =
      _$ButtonFailureCopyWithImpl<$Res>;
  $Res call({Failure? failure});
}

/// @nodoc
class _$ButtonFailureCopyWithImpl<$Res> extends _$ButtonStateCopyWithImpl<$Res>
    implements $ButtonFailureCopyWith<$Res> {
  _$ButtonFailureCopyWithImpl(
      ButtonFailure _value, $Res Function(ButtonFailure) _then)
      : super(_value, (v) => _then(v as ButtonFailure));

  @override
  ButtonFailure get _value => super._value as ButtonFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(ButtonFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc
class _$ButtonFailure implements ButtonFailure {
  const _$ButtonFailure([this.failure]);

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'ButtonState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ButtonFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $ButtonFailureCopyWith<ButtonFailure> get copyWith =>
      _$ButtonFailureCopyWithImpl<ButtonFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() idle,
    required TResult Function() busy,
    required TResult Function(Failure? failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? idle,
    TResult Function()? busy,
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
    required TResult Function(ButtonInitializing value) initializing,
    required TResult Function(ButtonIdle value) idle,
    required TResult Function(ButtonBusy value) busy,
    required TResult Function(ButtonFailure value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ButtonInitializing value)? initializing,
    TResult Function(ButtonIdle value)? idle,
    TResult Function(ButtonBusy value)? busy,
    TResult Function(ButtonFailure value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class ButtonFailure implements ButtonState {
  const factory ButtonFailure([Failure? failure]) = _$ButtonFailure;

  Failure? get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ButtonFailureCopyWith<ButtonFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
