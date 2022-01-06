import 'dart:async';

import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../verbeelding_verbindt_ui.dart';

class StepDetailsCubit extends CubitBase<StepDetailsState>
    with DisposableMixin {
  StepDetailsCubit({
    required StreamUsersRouteUseCase streamUsersRouteUseCase,
  })  : _streamUsersRoute = streamUsersRouteUseCase,
        super(const StepDetailsState.initializing());

  final StreamUsersRouteUseCase _streamUsersRoute;
  late StreamSubscription _streamSubscription;

  Future<void> init(
    StepDetailsParams params,
  ) async {
    final validParams = params.validate();
    if (!validParams) {
      emit(const StepDetailsState.invalidParams());
      return;
    }
    _streamSubscription = _streamUsersRoute(null).listen((route) {
      if (route == null) {
        emit(const StepDetailsState.invalidParams());
        _streamSubscription.cancel();
        return;
      }
      final validIndex = route.stops.length <= params.index + 1;
      if (validIndex) {
        emit(const StepDetailsState.invalidParams());
        _streamSubscription.cancel();
        return;
      }
      final artist = route.stops[params.index].artist;
      emit(StepDetailsState.loaded(
        artist: artist,
        youtubeController: YoutubePlayerController(
          initialVideoId: artist.detailsContent.video.videoId,
        ),
      ));
    }, onError: (_) {
      emit(const StepDetailsState.failed());
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
