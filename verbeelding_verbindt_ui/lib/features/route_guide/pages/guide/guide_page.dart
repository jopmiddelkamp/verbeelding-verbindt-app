import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verbeelding_verbindt_core/aliases.dart';

import '../../../../shared/dialogs/confirm/confirm_dialog.dart';
import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../shared/widgets/text/translatable_text.dart';
import '../../../../theme.dart';
import 'bloc/bloc.dart';
import 'widgets/route_list_item.dart';
import 'widgets/route_map.dart';

class GuidePage extends StatelessWidget {
  const GuidePage._();

  static Widget blocProvider(
    GuidePageArguments argument,
  ) {
    return BlocProvider(
      create: (_) {
        final cubit = GuideCubit(
          createRouteUseCase: serviceLocator(),
          deleteRouteUseCase: serviceLocator(),
          getUsersRouteUseCase: serviceLocator(),
          nextRouteStopUseCase: serviceLocator(),
          fetchUserLocationUseCase: serviceLocator(),
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
    final cubit = context.cubit<GuideCubit>();
    return WillPopScope(
      onWillPop: () async {
        final result = await showConfirmDialog(
          context,
          content: (c, _) => c.l10n.guidePage.popConfirmMessage,
        );
        if (result) {
          await cubit.delete();
        }
        return result;
      },
      child: Scaffold(
        appBar: AppBar(
          title: TranslatedText(
            (c, _) => c.l10n.guidePage.title,
          ),
        ),
        body: BlocBuilder<GuideCubit, GuideState>(
          builder: (context, routeState) {
            if (routeState is! GuideLoaded) {
              return Center(
                child: VVCircleLoadingIndicator(
                  text: (c, _) => c.l10n.guidePage.busySettingUpRoute,
                ),
              );
            }
            return LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    RouteMap(
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
                            return RouteListItem(
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
