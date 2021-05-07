import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/entities/common/artist.dart';

import '../../../../../shared/extensions/build_context_extensions.dart';
import '../../artist_details/artist_details_page.dart';
import '../guide_cubit.dart';
import '../guide_state.dart';

class MoreInfoButton extends StatelessWidget {
  const MoreInfoButton({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<GuideCubit, GuideState>(
      buildWhen: (previous, current) {
        return previous.currentStop != current.currentStop;
      },
      builder: (context, state) {
        return TextButton(
          child: Text('Meer info'),
          onPressed: state.routeLoaded
              ? () => _onPressed(context, state.currentStop!.artist)
              : null,
        );
      },
    );
  }

  Future _onPressed(
    BuildContext context,
    ArtistEntity artist,
  ) async {
    final result = await context.navigator.pushNamed<bool>(
      ArtistDetailsPage.routeName,
      arguments: ArtistDetailsPageArguments(
        artist: artist,
      ),
    );
    if (result == true) {
      context.blocProvider<GuideCubit>().next();
    }
  }
}
