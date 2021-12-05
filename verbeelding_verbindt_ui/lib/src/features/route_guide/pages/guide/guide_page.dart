import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class GuidePage extends StatelessWidget {
  const GuidePage._();

  static Widget bloc(
    GuidePageArguments argument,
  ) {
    return BlocProvider(
      create: (_) {
        final cubit = GuideCubit(
          createRouteUseCase: GetIt.instance(),
          deleteRouteUseCase: GetIt.instance(),
          getUsersRouteUseCase: GetIt.instance(),
          nextRouteStopUseCase: GetIt.instance(),
          fetchUserLocationUseCase: GetIt.instance(),
        );
        if (argument is CreateRouteGuidePageArguments) {
          cubit.createRoute(
            selectedSpecialityIds: argument.selectedSpecialityIds,
          );
        } else {
          cubit.loadRoute();
        }
        return cubit;
      },
      child: const GuidePage._(),
    );
  }

  static const String routeName = 'route_guide_guide';

  @override
  Widget build(
    BuildContext context,
  ) {
    final cubit = context.read<GuideCubit>();
    return BlocListener<GuideCubit, GuideState>(
      listener: (context, state) {
        if (state is GuideCompleted) {
          context.navigator.popAndPushNamed(
            CompletedPage.routeName,
            arguments: state.route.id,
          );
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          final result = await showConfirmDialog(
            context,
            content: context.l10n.pageGuidePopConfirmMessage,
          );
          if (result) {
            await cubit.delete();
          }
          return result;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              context.l10n.pageGuideTitle,
            ),
          ),
          body: BlocBuilder<GuideCubit, GuideState>(
            builder: (context, routeState) {
              if (routeState is! GuideLoaded) {
                return Center(
                  child: VVCircleLoadingIndicator(
                    text: context.l10n.pageGuideBusySettingUpRoute,
                  ),
                );
              }
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      GuidePageRouteMap(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight / 3,
                        stops: routeState.route.stops,
                        currentStop: routeState.route.currentStop,
                        initialMapLocation: routeState.initialUserLocation,
                      ),
                      Expanded(
                        child: Container(
                          decoration: getTopShadowBoxDecoration(context),
                          child: ListView.builder(
                            itemCount: routeState.route.stops.length,
                            itemBuilder: (context, index) {
                              final stop = routeState.route.stops[index];
                              return GuidePageRouteListItem(
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
      ),
    );
  }
}

abstract class GuidePageArguments {
  const GuidePageArguments();
}

class CreateRouteGuidePageArguments extends GuidePageArguments {
  const CreateRouteGuidePageArguments({
    required this.selectedSpecialityIds,
  });

  final List<String> selectedSpecialityIds;
}

class OpenRouteGuidePageArguments extends GuidePageArguments {
  const OpenRouteGuidePageArguments();
}
