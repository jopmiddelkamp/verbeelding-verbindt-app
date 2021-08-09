// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  AppInitializing initializing() {
    return const AppInitializing();
  }

  AppLoaded loaded(
      {required bool hasAcceptedIntro,
      required bool hasSignedIn,
      required bool hasActiveRoute}) {
    return AppLoaded(
      hasAcceptedIntro: hasAcceptedIntro,
      hasSignedIn: hasSignedIn,
      hasActiveRoute: hasActiveRoute,
    );
  }

  AppFailure failed([Failure? failure]) {
    return AppFailure(
      failure,
    );
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            bool hasAcceptedIntro, bool hasSignedIn, bool hasActiveRoute)
        loaded,
    required TResult Function(Failure? failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            bool hasAcceptedIntro, bool hasSignedIn, bool hasActiveRoute)?
        loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializing value) initializing,
    required TResult Function(AppLoaded value) loaded,
    required TResult Function(AppFailure value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializing value)? initializing,
    TResult Function(AppLoaded value)? loaded,
    TResult Function(AppFailure value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;
}

/// @nodoc
abstract class $AppInitializingCopyWith<$Res> {
  factory $AppInitializingCopyWith(
          AppInitializing value, $Res Function(AppInitializing) then) =
      _$AppInitializingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppInitializingCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements $AppInitializingCopyWith<$Res> {
  _$AppInitializingCopyWithImpl(
      AppInitializing _value, $Res Function(AppInitializing) _then)
      : super(_value, (v) => _then(v as AppInitializing));

  @override
  AppInitializing get _value => super._value as AppInitializing;
}

/// @nodoc
class _$AppInitializing implements AppInitializing {
  const _$AppInitializing();

  @override
  String toString() {
    return 'AppState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AppInitializing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            bool hasAcceptedIntro, bool hasSignedIn, bool hasActiveRoute)
        loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            bool hasAcceptedIntro, bool hasSignedIn, bool hasActiveRoute)?
        loaded,
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
    required TResult Function(AppInitializing value) initializing,
    required TResult Function(AppLoaded value) loaded,
    required TResult Function(AppFailure value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializing value)? initializing,
    TResult Function(AppLoaded value)? loaded,
    TResult Function(AppFailure value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class AppInitializing implements AppState {
  const factory AppInitializing() = _$AppInitializing;
}

/// @nodoc
abstract class $AppLoadedCopyWith<$Res> {
  factory $AppLoadedCopyWith(AppLoaded value, $Res Function(AppLoaded) then) =
      _$AppLoadedCopyWithImpl<$Res>;
  $Res call({bool hasAcceptedIntro, bool hasSignedIn, bool hasActiveRoute});
}

/// @nodoc
class _$AppLoadedCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements $AppLoadedCopyWith<$Res> {
  _$AppLoadedCopyWithImpl(AppLoaded _value, $Res Function(AppLoaded) _then)
      : super(_value, (v) => _then(v as AppLoaded));

  @override
  AppLoaded get _value => super._value as AppLoaded;

  @override
  $Res call({
    Object? hasAcceptedIntro = freezed,
    Object? hasSignedIn = freezed,
    Object? hasActiveRoute = freezed,
  }) {
    return _then(AppLoaded(
      hasAcceptedIntro: hasAcceptedIntro == freezed
          ? _value.hasAcceptedIntro
          : hasAcceptedIntro // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSignedIn: hasSignedIn == freezed
          ? _value.hasSignedIn
          : hasSignedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      hasActiveRoute: hasActiveRoute == freezed
          ? _value.hasActiveRoute
          : hasActiveRoute // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$AppLoaded implements AppLoaded {
  const _$AppLoaded(
      {required this.hasAcceptedIntro,
      required this.hasSignedIn,
      required this.hasActiveRoute});

  @override
  final bool hasAcceptedIntro;
  @override
  final bool hasSignedIn;
  @override
  final bool hasActiveRoute;

  @override
  String toString() {
    return 'AppState.loaded(hasAcceptedIntro: $hasAcceptedIntro, hasSignedIn: $hasSignedIn, hasActiveRoute: $hasActiveRoute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppLoaded &&
            (identical(other.hasAcceptedIntro, hasAcceptedIntro) ||
                const DeepCollectionEquality()
                    .equals(other.hasAcceptedIntro, hasAcceptedIntro)) &&
            (identical(other.hasSignedIn, hasSignedIn) ||
                const DeepCollectionEquality()
                    .equals(other.hasSignedIn, hasSignedIn)) &&
            (identical(other.hasActiveRoute, hasActiveRoute) ||
                const DeepCollectionEquality()
                    .equals(other.hasActiveRoute, hasActiveRoute)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hasAcceptedIntro) ^
      const DeepCollectionEquality().hash(hasSignedIn) ^
      const DeepCollectionEquality().hash(hasActiveRoute);

  @JsonKey(ignore: true)
  @override
  $AppLoadedCopyWith<AppLoaded> get copyWith =>
      _$AppLoadedCopyWithImpl<AppLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            bool hasAcceptedIntro, bool hasSignedIn, bool hasActiveRoute)
        loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return loaded(hasAcceptedIntro, hasSignedIn, hasActiveRoute);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            bool hasAcceptedIntro, bool hasSignedIn, bool hasActiveRoute)?
        loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(hasAcceptedIntro, hasSignedIn, hasActiveRoute);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppInitializing value) initializing,
    required TResult Function(AppLoaded value) loaded,
    required TResult Function(AppFailure value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializing value)? initializing,
    TResult Function(AppLoaded value)? loaded,
    TResult Function(AppFailure value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AppLoaded implements AppState {
  const factory AppLoaded(
      {required bool hasAcceptedIntro,
      required bool hasSignedIn,
      required bool hasActiveRoute}) = _$AppLoaded;

  bool get hasAcceptedIntro => throw _privateConstructorUsedError;
  bool get hasSignedIn => throw _privateConstructorUsedError;
  bool get hasActiveRoute => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppLoadedCopyWith<AppLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
          AppFailure value, $Res Function(AppFailure) then) =
      _$AppFailureCopyWithImpl<$Res>;
  $Res call({Failure? failure});
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(AppFailure _value, $Res Function(AppFailure) _then)
      : super(_value, (v) => _then(v as AppFailure));

  @override
  AppFailure get _value => super._value as AppFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(AppFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc
class _$AppFailure implements AppFailure {
  const _$AppFailure([this.failure]);

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'AppState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AppFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $AppFailureCopyWith<AppFailure> get copyWith =>
      _$AppFailureCopyWithImpl<AppFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            bool hasAcceptedIntro, bool hasSignedIn, bool hasActiveRoute)
        loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            bool hasAcceptedIntro, bool hasSignedIn, bool hasActiveRoute)?
        loaded,
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
    required TResult Function(AppInitializing value) initializing,
    required TResult Function(AppLoaded value) loaded,
    required TResult Function(AppFailure value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppInitializing value)? initializing,
    TResult Function(AppLoaded value)? loaded,
    TResult Function(AppFailure value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class AppFailure implements AppState {
  const factory AppFailure([Failure? failure]) = _$AppFailure;

  Failure? get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppFailureCopyWith<AppFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
