import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class StepsOverviewPage extends StatelessWidget {
  const StepsOverviewPage({
    Key? key,
  }) : super(key: key);

  static const String name = 'steps';

  static void go(BuildContext context) => context.goNamed(name);

  BlocProvider<StepsOverviewCubit> _blocProvider(
    WidgetBuilder builder,
  ) {
    return BlocProvider(
      create: (_) => StepsOverviewCubit(
        deleteRouteUseCase: GetIt.instance(),
        getUsersRouteUseCase: GetIt.instance(),
        completeRouteStopUseCase: GetIt.instance(),
        locationService: GetIt.instance(),
      )..init(),
      child: Builder(builder: builder),
    );
  }

  void _listener(
    BuildContext context,
    StepsOverviewState state,
  ) {
    if (state is StepsOverviewCompleted) {
      CompletedPage.go(context);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return _blocProvider((context) {
      final cubit = context.read<StepsOverviewCubit>();
      return BlocListener<StepsOverviewCubit, StepsOverviewState>(
        listener: _listener,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              context.l10n.pageStepsOverviewTitle,
            ),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                final result = await showConfirmDialog(
                  context,
                  content: context.l10n.pageStepsOverviewPopConfirmMessage,
                );
                if (result) {
                  await cubit.delete();
                  SelectInterestsPage.go(context);
                }
              },
            ),
          ),
          body: BlocBuilder<StepsOverviewCubit, StepsOverviewState>(
            buildWhen: (_, current) => current is! StepsOverviewCompleted,
            builder: (context, routeState) {
              if (routeState is! StepsOverviewLoaded) {
                return Center(
                  child: VVCircleLoadingIndicator(
                    text: context.l10n.pageStepsOverviewBusySettingUpRoute,
                  ),
                );
              }
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      StepsOverviewPageRouteMap(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight / 3,
                        stops: routeState.route.stops,
                        currentStop: routeState.route.currentStop,
                        initialMapLocation: routeState.initialUserLocation,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.background,
                            boxShadow: createBoxShadowTop(
                              context.customTheme,
                            ),
                          ),
                          child: ListView.builder(
                            itemCount: routeState.route.stops.length,
                            itemBuilder: (context, index) {
                              final stop = routeState.route.stops[index];
                              return StepsOverviewPageRouteListItem(
                                count: routeState.route.stops.length,
                                index: index,
                                stop: stop,
                                active: routeState.route.currentStop == stop,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      );
    });
  }
}
