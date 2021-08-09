// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  AuthInitializing initializing() {
    return const AuthInitializing();
  }

  AuthLoaded loaded({required UserEntity? authenticatedUser}) {
    return AuthLoaded(
      authenticatedUser: authenticatedUser,
    );
  }

  AuthFailure failed([Failure? failure]) {
    return AuthFailure(
      failure,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(UserEntity? authenticatedUser) loaded,
    required TResult Function(Failure? failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(UserEntity? authenticatedUser)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitializing value) initializing,
    required TResult Function(AuthLoaded value) loaded,
    required TResult Function(AuthFailure value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitializing value)? initializing,
    TResult Function(AuthLoaded value)? loaded,
    TResult Function(AuthFailure value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class $AuthInitializingCopyWith<$Res> {
  factory $AuthInitializingCopyWith(
          AuthInitializing value, $Res Function(AuthInitializing) then) =
      _$AuthInitializingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthInitializingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthInitializingCopyWith<$Res> {
  _$AuthInitializingCopyWithImpl(
      AuthInitializing _value, $Res Function(AuthInitializing) _then)
      : super(_value, (v) => _then(v as AuthInitializing));

  @override
  AuthInitializing get _value => super._value as AuthInitializing;
}

/// @nodoc
class _$AuthInitializing implements AuthInitializing {
  const _$AuthInitializing();

  @override
  String toString() {
    return 'AuthState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthInitializing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(UserEntity? authenticatedUser) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(UserEntity? authenticatedUser)? loaded,
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
    required TResult Function(AuthInitializing value) initializing,
    required TResult Function(AuthLoaded value) loaded,
    required TResult Function(AuthFailure value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitializing value)? initializing,
    TResult Function(AuthLoaded value)? loaded,
    TResult Function(AuthFailure value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class AuthInitializing implements AuthState {
  const factory AuthInitializing() = _$AuthInitializing;
}

/// @nodoc
abstract class $AuthLoadedCopyWith<$Res> {
  factory $AuthLoadedCopyWith(
          AuthLoaded value, $Res Function(AuthLoaded) then) =
      _$AuthLoadedCopyWithImpl<$Res>;
  $Res call({UserEntity? authenticatedUser});
}

/// @nodoc
class _$AuthLoadedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthLoadedCopyWith<$Res> {
  _$AuthLoadedCopyWithImpl(AuthLoaded _value, $Res Function(AuthLoaded) _then)
      : super(_value, (v) => _then(v as AuthLoaded));

  @override
  AuthLoaded get _value => super._value as AuthLoaded;

  @override
  $Res call({
    Object? authenticatedUser = freezed,
  }) {
    return _then(AuthLoaded(
      authenticatedUser: authenticatedUser == freezed
          ? _value.authenticatedUser
          : authenticatedUser // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ));
  }
}

/// @nodoc
class _$AuthLoaded implements AuthLoaded {
  const _$AuthLoaded({required this.authenticatedUser});

  @override
  final UserEntity? authenticatedUser;

  @override
  String toString() {
    return 'AuthState.loaded(authenticatedUser: $authenticatedUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthLoaded &&
            (identical(other.authenticatedUser, authenticatedUser) ||
                const DeepCollectionEquality()
                    .equals(other.authenticatedUser, authenticatedUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(authenticatedUser);

  @JsonKey(ignore: true)
  @override
  $AuthLoadedCopyWith<AuthLoaded> get copyWith =>
      _$AuthLoadedCopyWithImpl<AuthLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(UserEntity? authenticatedUser) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return loaded(authenticatedUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(UserEntity? authenticatedUser)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(authenticatedUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitializing value) initializing,
    required TResult Function(AuthLoaded value) loaded,
    required TResult Function(AuthFailure value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitializing value)? initializing,
    TResult Function(AuthLoaded value)? loaded,
    TResult Function(AuthFailure value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AuthLoaded implements AuthState {
  const factory AuthLoaded({required UserEntity? authenticatedUser}) =
      _$AuthLoaded;

  UserEntity? get authenticatedUser => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthLoadedCopyWith<AuthLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
  $Res call({Failure? failure});
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(
      AuthFailure _value, $Res Function(AuthFailure) _then)
      : super(_value, (v) => _then(v as AuthFailure));

  @override
  AuthFailure get _value => super._value as AuthFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(AuthFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc
class _$AuthFailure implements AuthFailure {
  const _$AuthFailure([this.failure]);

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'AuthState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(UserEntity? authenticatedUser) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(UserEntity? authenticatedUser)? loaded,
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
    required TResult Function(AuthInitializing value) initializing,
    required TResult Function(AuthLoaded value) loaded,
    required TResult Function(AuthFailure value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitializing value)? initializing,
    TResult Function(AuthLoaded value)? loaded,
    TResult Function(AuthFailure value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class AuthFailure implements AuthState {
  const factory AuthFailure([Failure? failure]) = _$AuthFailure;

  Failure? get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
