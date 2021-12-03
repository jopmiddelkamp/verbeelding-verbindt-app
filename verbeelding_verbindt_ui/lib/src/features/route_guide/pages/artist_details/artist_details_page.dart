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
              state: state,
            ),
            failed: (_) => const FailureStateDisplay(),
          );
        },
      ),
    );
  }

  Column _buildLoadedState({
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
                const SizedBox(height: kDefaultSpacing),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Text(state.artist.detailsContent.text.value),
                ),
                const SizedBox(height: kDefaultSpacing),
                ArtistDetailsPageImageList(
                  state.artist.detailsContent.images,
                  padding: const EdgeInsets.fromLTRB(
                    kDefaultPadding,
                    0,
                    kDefaultPadding,
                    kDefaultPadding,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(
            kDefaultPadding,
            0,
            kDefaultPadding,
            kDefaultPadding,
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

  final ArtistEntity artist;
}
