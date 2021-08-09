// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'artist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ArtistStateTearOff {
  const _$ArtistStateTearOff();

  ArtistDetailsInitializingState initializing() {
    return const ArtistDetailsInitializingState();
  }

  ArtistDetailsLoadedState loaded({required ArtistEntity artist}) {
    return ArtistDetailsLoadedState(
      artist: artist,
    );
  }

  ArtistDetailsFailureState failed() {
    return const ArtistDetailsFailureState();
  }
}

/// @nodoc
const $ArtistState = _$ArtistStateTearOff();

/// @nodoc
mixin _$ArtistState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(ArtistEntity artist) loaded,
    required TResult Function() failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(ArtistEntity artist)? loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArtistDetailsInitializingState value)
        initializing,
    required TResult Function(ArtistDetailsLoadedState value) loaded,
    required TResult Function(ArtistDetailsFailureState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArtistDetailsInitializingState value)? initializing,
    TResult Function(ArtistDetailsLoadedState value)? loaded,
    TResult Function(ArtistDetailsFailureState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistStateCopyWith<$Res> {
  factory $ArtistStateCopyWith(
          ArtistState value, $Res Function(ArtistState) then) =
      _$ArtistStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ArtistStateCopyWithImpl<$Res> implements $ArtistStateCopyWith<$Res> {
  _$ArtistStateCopyWithImpl(this._value, this._then);

  final ArtistState _value;
  // ignore: unused_field
  final $Res Function(ArtistState) _then;
}

/// @nodoc
abstract class $ArtistDetailsInitializingStateCopyWith<$Res> {
  factory $ArtistDetailsInitializingStateCopyWith(
          ArtistDetailsInitializingState value,
          $Res Function(ArtistDetailsInitializingState) then) =
      _$ArtistDetailsInitializingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ArtistDetailsInitializingStateCopyWithImpl<$Res>
    extends _$ArtistStateCopyWithImpl<$Res>
    implements $ArtistDetailsInitializingStateCopyWith<$Res> {
  _$ArtistDetailsInitializingStateCopyWithImpl(
      ArtistDetailsInitializingState _value,
      $Res Function(ArtistDetailsInitializingState) _then)
      : super(_value, (v) => _then(v as ArtistDetailsInitializingState));

  @override
  ArtistDetailsInitializingState get _value =>
      super._value as ArtistDetailsInitializingState;
}

/// @nodoc
class _$ArtistDetailsInitializingState
    implements ArtistDetailsInitializingState {
  const _$ArtistDetailsInitializingState();

  @override
  String toString() {
    return 'ArtistState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ArtistDetailsInitializingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(ArtistEntity artist) loaded,
    required TResult Function() failed,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(ArtistEntity artist)? loaded,
    TResult Function()? failed,
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
    required TResult Function(ArtistDetailsInitializingState value)
        initializing,
    required TResult Function(ArtistDetailsLoadedState value) loaded,
    required TResult Function(ArtistDetailsFailureState value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArtistDetailsInitializingState value)? initializing,
    TResult Function(ArtistDetailsLoadedState value)? loaded,
    TResult Function(ArtistDetailsFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class ArtistDetailsInitializingState implements ArtistState {
  const factory ArtistDetailsInitializingState() =
      _$ArtistDetailsInitializingState;
}

/// @nodoc
abstract class $ArtistDetailsLoadedStateCopyWith<$Res> {
  factory $ArtistDetailsLoadedStateCopyWith(ArtistDetailsLoadedState value,
          $Res Function(ArtistDetailsLoadedState) then) =
      _$ArtistDetailsLoadedStateCopyWithImpl<$Res>;
  $Res call({ArtistEntity artist});
}

/// @nodoc
class _$ArtistDetailsLoadedStateCopyWithImpl<$Res>
    extends _$ArtistStateCopyWithImpl<$Res>
    implements $ArtistDetailsLoadedStateCopyWith<$Res> {
  _$ArtistDetailsLoadedStateCopyWithImpl(ArtistDetailsLoadedState _value,
      $Res Function(ArtistDetailsLoadedState) _then)
      : super(_value, (v) => _then(v as ArtistDetailsLoadedState));

  @override
  ArtistDetailsLoadedState get _value =>
      super._value as ArtistDetailsLoadedState;

  @override
  $Res call({
    Object? artist = freezed,
  }) {
    return _then(ArtistDetailsLoadedState(
      artist: artist == freezed
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as ArtistEntity,
    ));
  }
}

/// @nodoc
class _$ArtistDetailsLoadedState implements ArtistDetailsLoadedState {
  const _$ArtistDetailsLoadedState({required this.artist});

  @override
  final ArtistEntity artist;

  @override
  String toString() {
    return 'ArtistState.loaded(artist: $artist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ArtistDetailsLoadedState &&
            (identical(other.artist, artist) ||
                const DeepCollectionEquality().equals(other.artist, artist)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(artist);

  @JsonKey(ignore: true)
  @override
  $ArtistDetailsLoadedStateCopyWith<ArtistDetailsLoadedState> get copyWith =>
      _$ArtistDetailsLoadedStateCopyWithImpl<ArtistDetailsLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(ArtistEntity artist) loaded,
    required TResult Function() failed,
  }) {
    return loaded(artist);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(ArtistEntity artist)? loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(artist);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArtistDetailsInitializingState value)
        initializing,
    required TResult Function(ArtistDetailsLoadedState value) loaded,
    required TResult Function(ArtistDetailsFailureState value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArtistDetailsInitializingState value)? initializing,
    TResult Function(ArtistDetailsLoadedState value)? loaded,
    TResult Function(ArtistDetailsFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ArtistDetailsLoadedState implements ArtistState {
  const factory ArtistDetailsLoadedState({required ArtistEntity artist}) =
      _$ArtistDetailsLoadedState;

  ArtistEntity get artist => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistDetailsLoadedStateCopyWith<ArtistDetailsLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistDetailsFailureStateCopyWith<$Res> {
  factory $ArtistDetailsFailureStateCopyWith(ArtistDetailsFailureState value,
          $Res Function(ArtistDetailsFailureState) then) =
      _$ArtistDetailsFailureStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ArtistDetailsFailureStateCopyWithImpl<$Res>
    extends _$ArtistStateCopyWithImpl<$Res>
    implements $ArtistDetailsFailureStateCopyWith<$Res> {
  _$ArtistDetailsFailureStateCopyWithImpl(ArtistDetailsFailureState _value,
      $Res Function(ArtistDetailsFailureState) _then)
      : super(_value, (v) => _then(v as ArtistDetailsFailureState));

  @override
  ArtistDetailsFailureState get _value =>
      super._value as ArtistDetailsFailureState;
}

/// @nodoc
class _$ArtistDetailsFailureState implements ArtistDetailsFailureState {
  const _$ArtistDetailsFailureState();

  @override
  String toString() {
    return 'ArtistState.failed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ArtistDetailsFailureState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(ArtistEntity artist) loaded,
    required TResult Function() failed,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(ArtistEntity artist)? loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArtistDetailsInitializingState value)
        initializing,
    required TResult Function(ArtistDetailsLoadedState value) loaded,
    required TResult Function(ArtistDetailsFailureState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArtistDetailsInitializingState value)? initializing,
    TResult Function(ArtistDetailsLoadedState value)? loaded,
    TResult Function(ArtistDetailsFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class ArtistDetailsFailureState implements ArtistState {
  const factory ArtistDetailsFailureState() = _$ArtistDetailsFailureState;
}
