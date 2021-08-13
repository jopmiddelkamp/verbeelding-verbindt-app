import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/entities/common/artist.dart';

import '../../../../shared/widgets/bloc/failure_state_display.dart';
import '../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../shared/widgets/video/video.dart';
import '../../../../theme.sizes.dart';
import '../../blocs/artist/bloc.dart';
import 'widgets/image_list.dart';
import 'widgets/visit_website_button.dart';

class ArtistDetailsPage extends StatelessWidget {
  const ArtistDetailsPage._();

  static Widget blocProvider(
    ArtistDetailsPageArguments arguments,
  ) {
    return BlocProvider(
      create: (_) => ArtistCubit()..init(artist: arguments.artist),
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
      body: BlocBuilder<ArtistCubit, ArtistState>(
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
    required ArtistLoaded state,
  }) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Video.blocProvider(
                  state.artist.detailsContent.video,
                ),
                const SizedBox(height: kDefaultSpacing),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Text(state.artist.detailsContent.text.value),
                ),
                const SizedBox(height: kDefaultSpacing),
                ImageList(
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
          child: VisitWebsiteButton(state.artist.website),
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
