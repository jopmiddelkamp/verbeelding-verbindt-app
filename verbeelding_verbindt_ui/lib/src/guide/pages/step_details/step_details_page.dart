import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class StepDetailsParams extends DelegatingMap<String, String> {
  StepDetailsParams({
    required int index,
  }) : super({
          indexKey: index.toString(),
        });

  StepDetailsParams.fromParams(Map<String, String> base) : super(base);

  static const String indexKey = 'index';

  int get index => int.parse(this[indexKey]!);

  bool validate() => this[indexKey] != null && index > -1;
}

class StepDetailsPage extends StatelessWidget {
  const StepDetailsPage(
    this.params, {
    Key? key,
  }) : super(key: key);

  final StepDetailsParams params;

  static const String name = 'step_details';

  static void go(
    BuildContext context, {
    required StepDetailsParams params,
  }) {
    context.goNamed(
      name,
      params: params,
    );
  }

  BlocProvider<StepDetailsCubit> _blocProvider(
    WidgetBuilder builder,
  ) {
    return BlocProvider(
      create: (_) => StepDetailsCubit(
        streamUsersRouteUseCase: GetIt.instance(),
      )..init(params),
      child: Builder(builder: builder),
    );
  }

  void _listener(
    BuildContext context,
    StepDetailsState state,
  ) {
    state.mapOrNull(
      invalidParams: (_) {
        debugPrint('### StepDetailsPage.invalidParams: pop()');
        context.pop();
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return _blocProvider((context) {
      return BlocListener<StepDetailsCubit, StepDetailsState>(
        listener: _listener,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: BlocBuilder<StepDetailsCubit, StepDetailsState>(
            builder: (context, state) {
              return state.maybeMap(
                initializing: (_) => const VVCircleLoadingIndicator(),
                loaded: (state) => _buildLoadedState(
                  context,
                  state: state,
                ),
                failed: (_) => const FailureStateDisplay(),
                orElse: () => Container(),
              );
            },
          ),
        ),
      );
    });
  }

  Column _buildLoadedState(
    BuildContext context, {
    required StepDetailsLoaded state,
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
                StepDetailsPageImageList(
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
          child: StepDetailsPageVisitWebsiteButton(state.artist.website),
        ),
      ],
    );
  }
}
