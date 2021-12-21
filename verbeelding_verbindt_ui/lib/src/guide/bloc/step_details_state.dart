import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'step_details_state.freezed.dart';

@freezed
class StepDetailsState with _$StepDetailsState {
  const factory StepDetailsState.initializing() = StepDetailsInitializing;

  const factory StepDetailsState.loaded({
    required Artist artist,
    required YoutubePlayerController youtubeController,
  }) = StepDetailsLoaded;

  const factory StepDetailsState.invalidParams() = StepDetailsInvalidParams;
  const factory StepDetailsState.failed() = StepDetailsFailed;
}
