import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class ArtistDetailsPage extends StatelessWidget {
  const ArtistDetailsPage._();

  static Widget bloc(
    ArtistDetailsPageArguments arguments,
  ) {
    return BlocProvider(
      create: (_) => ArtistDetailsCubit()..init(artist: arguments.artist),
      child: const ArtistDetailsPage._(),
    );
  }

  static Future<bool?> push(
    BuildContext context, {
    required ArtistDetailsPageArguments arguments,
  }) {
    return context.navigator.pushNamed<bool>(
      routeName,
      arguments: arguments,
    );
  }

  static const String routeName = 'route_guide_artist_details';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<ArtistDetailsCubit, ArtistDetailsState>(
        builder: (context, state) {
          return state.map(
            initializing: (_) => const VVCircleLoadingIndicator(),
            loaded: (state) => _buildLoadedState(
              context,
              state: state,
            ),
            failed: (_) => const FailureStateDisplay(),
          );
        },
      ),
    );
  }

  Column _buildLoadedState(
    BuildContext context, {
    required ArtistDetailsLoaded state,
  }) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                YoutubePlayer(
                  controller: state.youtubeController,
                ),
                const SizedBox(height: SpacingSize.medium),
                Padding(
                  padding: const EdgeInsets.all(PaddingSize.medium),
                  child: Text(state.artist.detailsContent.text.value),
                ),
                const SizedBox(height: SpacingSize.medium),
                ArtistDetailsPageImageList(
                  state.artist.detailsContent.images,
                  padding: const EdgeInsets.fromLTRB(
                    PaddingSize.medium,
                    0,
                    PaddingSize.medium,
                    PaddingSize.medium,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(
            PaddingSize.medium,
            0,
            PaddingSize.medium,
            PaddingSize.medium,
          ),
          child: ArtistDetailsPageVisitWebsiteButton(state.artist.website),
        ),
      ],
    );
  }
}

class ArtistDetailsPageArguments {
  const ArtistDetailsPageArguments({
    required this.artist,
  });

  final ArtistGeoLocation artist;
}
