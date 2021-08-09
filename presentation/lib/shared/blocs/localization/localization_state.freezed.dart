// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'localization_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocalizationStateTearOff {
  const _$LocalizationStateTearOff();

  LocalizationInitializing initializing() {
    return const LocalizationInitializing();
  }

  LocalizationLoaded loaded({required LocaleEntity locale}) {
    return LocalizationLoaded(
      locale: locale,
    );
  }

  LocalizationFailure failed([Failure? failure]) {
    return LocalizationFailure(
      failure,
    );
  }
}

/// @nodoc
const $LocalizationState = _$LocalizationStateTearOff();

/// @nodoc
mixin _$LocalizationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(LocaleEntity locale) loaded,
    required TResult Function(Failure? failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(LocaleEntity locale)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalizationInitializing value) initializing,
    required TResult Function(LocalizationLoaded value) loaded,
    required TResult Function(LocalizationFailure value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalizationInitializing value)? initializing,
    TResult Function(LocalizationLoaded value)? loaded,
    TResult Function(LocalizationFailure value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationStateCopyWith<$Res> {
  factory $LocalizationStateCopyWith(
          LocalizationState value, $Res Function(LocalizationState) then) =
      _$LocalizationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocalizationStateCopyWithImpl<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  _$LocalizationStateCopyWithImpl(this._value, this._then);

  final LocalizationState _value;
  // ignore: unused_field
  final $Res Function(LocalizationState) _then;
}

/// @nodoc
abstract class $LocalizationInitializingCopyWith<$Res> {
  factory $LocalizationInitializingCopyWith(LocalizationInitializing value,
          $Res Function(LocalizationInitializing) then) =
      _$LocalizationInitializingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocalizationInitializingCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res>
    implements $LocalizationInitializingCopyWith<$Res> {
  _$LocalizationInitializingCopyWithImpl(LocalizationInitializing _value,
      $Res Function(LocalizationInitializing) _then)
      : super(_value, (v) => _then(v as LocalizationInitializing));

  @override
  LocalizationInitializing get _value =>
      super._value as LocalizationInitializing;
}

/// @nodoc
class _$LocalizationInitializing implements LocalizationInitializing {
  const _$LocalizationInitializing();

  @override
  String toString() {
    return 'LocalizationState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LocalizationInitializing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(LocaleEntity locale) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(LocaleEntity locale)? loaded,
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
    required TResult Function(LocalizationInitializing value) initializing,
    required TResult Function(LocalizationLoaded value) loaded,
    required TResult Function(LocalizationFailure value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalizationInitializing value)? initializing,
    TResult Function(LocalizationLoaded value)? loaded,
    TResult Function(LocalizationFailure value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class LocalizationInitializing implements LocalizationState {
  const factory LocalizationInitializing() = _$LocalizationInitializing;
}

/// @nodoc
abstract class $LocalizationLoadedCopyWith<$Res> {
  factory $LocalizationLoadedCopyWith(
          LocalizationLoaded value, $Res Function(LocalizationLoaded) then) =
      _$LocalizationLoadedCopyWithImpl<$Res>;
  $Res call({LocaleEntity locale});
}

/// @nodoc
class _$LocalizationLoadedCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res>
    implements $LocalizationLoadedCopyWith<$Res> {
  _$LocalizationLoadedCopyWithImpl(
      LocalizationLoaded _value, $Res Function(LocalizationLoaded) _then)
      : super(_value, (v) => _then(v as LocalizationLoaded));

  @override
  LocalizationLoaded get _value => super._value as LocalizationLoaded;

  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(LocalizationLoaded(
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as LocaleEntity,
    ));
  }
}

/// @nodoc
class _$LocalizationLoaded implements LocalizationLoaded {
  const _$LocalizationLoaded({required this.locale});

  @override
  final LocaleEntity locale;

  @override
  String toString() {
    return 'LocalizationState.loaded(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocalizationLoaded &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(locale);

  @JsonKey(ignore: true)
  @override
  $LocalizationLoadedCopyWith<LocalizationLoaded> get copyWith =>
      _$LocalizationLoadedCopyWithImpl<LocalizationLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(LocaleEntity locale) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return loaded(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(LocaleEntity locale)? loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocalizationInitializing value) initializing,
    required TResult Function(LocalizationLoaded value) loaded,
    required TResult Function(LocalizationFailure value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalizationInitializing value)? initializing,
    TResult Function(LocalizationLoaded value)? loaded,
    TResult Function(LocalizationFailure value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LocalizationLoaded implements LocalizationState {
  const factory LocalizationLoaded({required LocaleEntity locale}) =
      _$LocalizationLoaded;

  LocaleEntity get locale => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizationLoadedCopyWith<LocalizationLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationFailureCopyWith<$Res> {
  factory $LocalizationFailureCopyWith(
          LocalizationFailure value, $Res Function(LocalizationFailure) then) =
      _$LocalizationFailureCopyWithImpl<$Res>;
  $Res call({Failure? failure});
}

/// @nodoc
class _$LocalizationFailureCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res>
    implements $LocalizationFailureCopyWith<$Res> {
  _$LocalizationFailureCopyWithImpl(
      LocalizationFailure _value, $Res Function(LocalizationFailure) _then)
      : super(_value, (v) => _then(v as LocalizationFailure));

  @override
  LocalizationFailure get _value => super._value as LocalizationFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(LocalizationFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc
class _$LocalizationFailure implements LocalizationFailure {
  const _$LocalizationFailure([this.failure]);

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'LocalizationState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocalizationFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $LocalizationFailureCopyWith<LocalizationFailure> get copyWith =>
      _$LocalizationFailureCopyWithImpl<LocalizationFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(LocaleEntity locale) loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(LocaleEntity locale)? loaded,
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
    required TResult Function(LocalizationInitializing value) initializing,
    required TResult Function(LocalizationLoaded value) loaded,
    required TResult Function(LocalizationFailure value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocalizationInitializing value)? initializing,
    TResult Function(LocalizationLoaded value)? loaded,
    TResult Function(LocalizationFailure value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class LocalizationFailure implements LocalizationState {
  const factory LocalizationFailure([Failure? failure]) = _$LocalizationFailure;

  Failure? get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizationFailureCopyWith<LocalizationFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
