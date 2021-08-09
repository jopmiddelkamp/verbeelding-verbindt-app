// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VideoStateTearOff {
  const _$VideoStateTearOff();

  VideoInitializing initializing() {
    return const VideoInitializing();
  }

  VideoLoaded loaded(
      {required VideoEntity video,
      required VideoPlayerController controller,
      required bool controlsVisible,
      required bool playing,
      double volume = 0.75,
      double volumeBeforeMute = 0.75}) {
    return VideoLoaded(
      video: video,
      controller: controller,
      controlsVisible: controlsVisible,
      playing: playing,
      volume: volume,
      volumeBeforeMute: volumeBeforeMute,
    );
  }

  VideoFailure failed([Failure? failure]) {
    return VideoFailure(
      failure,
    );
  }
}

/// @nodoc
const $VideoState = _$VideoStateTearOff();

/// @nodoc
mixin _$VideoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            VideoEntity video,
            VideoPlayerController controller,
            bool controlsVisible,
            bool playing,
            double volume,
            double volumeBeforeMute)
        loaded,
    required TResult Function(Failure? failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            VideoEntity video,
            VideoPlayerController controller,
            bool controlsVisible,
            bool playing,
            double volume,
            double volumeBeforeMute)?
        loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoInitializing value) initializing,
    required TResult Function(VideoLoaded value) loaded,
    required TResult Function(VideoFailure value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitializing value)? initializing,
    TResult Function(VideoLoaded value)? loaded,
    TResult Function(VideoFailure value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoStateCopyWith<$Res> {
  factory $VideoStateCopyWith(
          VideoState value, $Res Function(VideoState) then) =
      _$VideoStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$VideoStateCopyWithImpl<$Res> implements $VideoStateCopyWith<$Res> {
  _$VideoStateCopyWithImpl(this._value, this._then);

  final VideoState _value;
  // ignore: unused_field
  final $Res Function(VideoState) _then;
}

/// @nodoc
abstract class $VideoInitializingCopyWith<$Res> {
  factory $VideoInitializingCopyWith(
          VideoInitializing value, $Res Function(VideoInitializing) then) =
      _$VideoInitializingCopyWithImpl<$Res>;
}

/// @nodoc
class _$VideoInitializingCopyWithImpl<$Res>
    extends _$VideoStateCopyWithImpl<$Res>
    implements $VideoInitializingCopyWith<$Res> {
  _$VideoInitializingCopyWithImpl(
      VideoInitializing _value, $Res Function(VideoInitializing) _then)
      : super(_value, (v) => _then(v as VideoInitializing));

  @override
  VideoInitializing get _value => super._value as VideoInitializing;
}

/// @nodoc
class _$VideoInitializing implements VideoInitializing {
  const _$VideoInitializing();

  @override
  String toString() {
    return 'VideoState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is VideoInitializing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            VideoEntity video,
            VideoPlayerController controller,
            bool controlsVisible,
            bool playing,
            double volume,
            double volumeBeforeMute)
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
            VideoEntity video,
            VideoPlayerController controller,
            bool controlsVisible,
            bool playing,
            double volume,
            double volumeBeforeMute)?
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
    required TResult Function(VideoInitializing value) initializing,
    required TResult Function(VideoLoaded value) loaded,
    required TResult Function(VideoFailure value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitializing value)? initializing,
    TResult Function(VideoLoaded value)? loaded,
    TResult Function(VideoFailure value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class VideoInitializing implements VideoState {
  const factory VideoInitializing() = _$VideoInitializing;
}

/// @nodoc
abstract class $VideoLoadedCopyWith<$Res> {
  factory $VideoLoadedCopyWith(
          VideoLoaded value, $Res Function(VideoLoaded) then) =
      _$VideoLoadedCopyWithImpl<$Res>;
  $Res call(
      {VideoEntity video,
      VideoPlayerController controller,
      bool controlsVisible,
      bool playing,
      double volume,
      double volumeBeforeMute});
}

/// @nodoc
class _$VideoLoadedCopyWithImpl<$Res> extends _$VideoStateCopyWithImpl<$Res>
    implements $VideoLoadedCopyWith<$Res> {
  _$VideoLoadedCopyWithImpl(
      VideoLoaded _value, $Res Function(VideoLoaded) _then)
      : super(_value, (v) => _then(v as VideoLoaded));

  @override
  VideoLoaded get _value => super._value as VideoLoaded;

  @override
  $Res call({
    Object? video = freezed,
    Object? controller = freezed,
    Object? controlsVisible = freezed,
    Object? playing = freezed,
    Object? volume = freezed,
    Object? volumeBeforeMute = freezed,
  }) {
    return _then(VideoLoaded(
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as VideoEntity,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController,
      controlsVisible: controlsVisible == freezed
          ? _value.controlsVisible
          : controlsVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      playing: playing == freezed
          ? _value.playing
          : playing // ignore: cast_nullable_to_non_nullable
              as bool,
      volume: volume == freezed
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      volumeBeforeMute: volumeBeforeMute == freezed
          ? _value.volumeBeforeMute
          : volumeBeforeMute // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
class _$VideoLoaded implements VideoLoaded {
  const _$VideoLoaded(
      {required this.video,
      required this.controller,
      required this.controlsVisible,
      required this.playing,
      this.volume = 0.75,
      this.volumeBeforeMute = 0.75});

  @override
  final VideoEntity video;
  @override
  final VideoPlayerController controller;
  @override
  final bool controlsVisible;
  @override
  final bool playing;
  @JsonKey(defaultValue: 0.75)
  @override
  final double volume;
  @JsonKey(defaultValue: 0.75)
  @override
  final double volumeBeforeMute;

  @override
  String toString() {
    return 'VideoState.loaded(video: $video, controller: $controller, controlsVisible: $controlsVisible, playing: $playing, volume: $volume, volumeBeforeMute: $volumeBeforeMute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VideoLoaded &&
            (identical(other.video, video) ||
                const DeepCollectionEquality().equals(other.video, video)) &&
            (identical(other.controller, controller) ||
                const DeepCollectionEquality()
                    .equals(other.controller, controller)) &&
            (identical(other.controlsVisible, controlsVisible) ||
                const DeepCollectionEquality()
                    .equals(other.controlsVisible, controlsVisible)) &&
            (identical(other.playing, playing) ||
                const DeepCollectionEquality()
                    .equals(other.playing, playing)) &&
            (identical(other.volume, volume) ||
                const DeepCollectionEquality().equals(other.volume, volume)) &&
            (identical(other.volumeBeforeMute, volumeBeforeMute) ||
                const DeepCollectionEquality()
                    .equals(other.volumeBeforeMute, volumeBeforeMute)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(video) ^
      const DeepCollectionEquality().hash(controller) ^
      const DeepCollectionEquality().hash(controlsVisible) ^
      const DeepCollectionEquality().hash(playing) ^
      const DeepCollectionEquality().hash(volume) ^
      const DeepCollectionEquality().hash(volumeBeforeMute);

  @JsonKey(ignore: true)
  @override
  $VideoLoadedCopyWith<VideoLoaded> get copyWith =>
      _$VideoLoadedCopyWithImpl<VideoLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            VideoEntity video,
            VideoPlayerController controller,
            bool controlsVisible,
            bool playing,
            double volume,
            double volumeBeforeMute)
        loaded,
    required TResult Function(Failure? failure) failed,
  }) {
    return loaded(
        video, controller, controlsVisible, playing, volume, volumeBeforeMute);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(
            VideoEntity video,
            VideoPlayerController controller,
            bool controlsVisible,
            bool playing,
            double volume,
            double volumeBeforeMute)?
        loaded,
    TResult Function(Failure? failure)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(video, controller, controlsVisible, playing, volume,
          volumeBeforeMute);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoInitializing value) initializing,
    required TResult Function(VideoLoaded value) loaded,
    required TResult Function(VideoFailure value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitializing value)? initializing,
    TResult Function(VideoLoaded value)? loaded,
    TResult Function(VideoFailure value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class VideoLoaded implements VideoState {
  const factory VideoLoaded(
      {required VideoEntity video,
      required VideoPlayerController controller,
      required bool controlsVisible,
      required bool playing,
      double volume,
      double volumeBeforeMute}) = _$VideoLoaded;

  VideoEntity get video => throw _privateConstructorUsedError;
  VideoPlayerController get controller => throw _privateConstructorUsedError;
  bool get controlsVisible => throw _privateConstructorUsedError;
  bool get playing => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;
  double get volumeBeforeMute => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoLoadedCopyWith<VideoLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoFailureCopyWith<$Res> {
  factory $VideoFailureCopyWith(
          VideoFailure value, $Res Function(VideoFailure) then) =
      _$VideoFailureCopyWithImpl<$Res>;
  $Res call({Failure? failure});
}

/// @nodoc
class _$VideoFailureCopyWithImpl<$Res> extends _$VideoStateCopyWithImpl<$Res>
    implements $VideoFailureCopyWith<$Res> {
  _$VideoFailureCopyWithImpl(
      VideoFailure _value, $Res Function(VideoFailure) _then)
      : super(_value, (v) => _then(v as VideoFailure));

  @override
  VideoFailure get _value => super._value as VideoFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(VideoFailure(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc
class _$VideoFailure implements VideoFailure {
  const _$VideoFailure([this.failure]);

  @override
  final Failure? failure;

  @override
  String toString() {
    return 'VideoState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VideoFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $VideoFailureCopyWith<VideoFailure> get copyWith =>
      _$VideoFailureCopyWithImpl<VideoFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(
            VideoEntity video,
            VideoPlayerController controller,
            bool controlsVisible,
            bool playing,
            double volume,
            double volumeBeforeMute)
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
            VideoEntity video,
            VideoPlayerController controller,
            bool controlsVisible,
            bool playing,
            double volume,
            double volumeBeforeMute)?
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
    required TResult Function(VideoInitializing value) initializing,
    required TResult Function(VideoLoaded value) loaded,
    required TResult Function(VideoFailure value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoInitializing value)? initializing,
    TResult Function(VideoLoaded value)? loaded,
    TResult Function(VideoFailure value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class VideoFailure implements VideoState {
  const factory VideoFailure([Failure? failure]) = _$VideoFailure;

  Failure? get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoFailureCopyWith<VideoFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
