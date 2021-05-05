import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/entities/artist.dart';

import '../../../../theme.sizes.dart';
import 'artist_details_cubit.dart';
import 'artist_details_state.dart';
import 'widgets/image_list.dart';
import 'widgets/intro_video.dart';
import 'widgets/visit_website_button.dart';

final serviceLocator = GetIt.instance;

class ArtistDetailsPage extends StatelessWidget {
  const ArtistDetailsPage._();

  static Widget blocProvider(
    ArtistDetailsPageArguments arguments,
  ) {
    return BlocProvider(
      create: (_) {
        return ArtistDetailsCubit(arguments);
      },
      child: const ArtistDetailsPage._(),
    );
  }

  static const String routeName = 'route_guide/artist_details';

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
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      IntroVideo(
                        video: state.artist.detailsContent.video,
                        controller: state.videoController,
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
        },
      ),
    );
  }
}

class ArtistDetailsPageArguments {
  const ArtistDetailsPageArguments({
    required this.artist,
  });

  final ArtistEntity artist;
}
