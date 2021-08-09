import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/common/video.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';
import 'package:video_player/video_player.dart';

part 'video_state.freezed.dart';

@freezed
class VideoState with _$VideoState {
  const factory VideoState.initializing() = VideoInitializing;
  const factory VideoState.loaded({
    required VideoEntity video,
    required VideoPlayerController controller,
    required bool controlsVisible,
    required bool playing,
    @Default(0.75) double volume,
    @Default(0.75) double volumeBeforeMute,
  }) = VideoLoaded;
  const factory VideoState.failed([
    Failure? failure,
  ]) = VideoFailure;
}

extension LoadedVideoStateX on VideoLoaded {
  bool get notPlaying => !playing;
  bool get controlsNotVisible => !controlsVisible;
  bool get mute => volume <= 0;
  bool get notMute => volume > 0;

  VideoState copyWith({
    VideoPlayerController? controller,
    bool? controlsVisible,
    bool? playing,
    double? volume,
    double? volumeBeforeMute,
  }) {
    return VideoState.loaded(
      video: video,
      controller: controller ?? this.controller,
      controlsVisible: controlsVisible ?? this.controlsVisible,
      playing: playing ?? this.playing,
      volume: volume ?? this.volume,
      volumeBeforeMute: volumeBeforeMute ?? this.volumeBeforeMute,
    );
  }
}
