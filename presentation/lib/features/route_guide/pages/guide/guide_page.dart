import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_presentation/shared/dialogs/confirm/confirm_dialog.dart';

import '../../../../shared/extensions/build_context_extensions.dart';
import '../../../../shared/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../shared/widgets/text/translatable_text.dart';
import '../../../../theme.dart';
import '../completed/completed_page.dart';
import 'guide_cubit.dart';
import 'guide_state.dart';
import 'widgets/route_list_item.dart';
import 'widgets/route_map.dart';

final serviceLocator = GetIt.instance;

class GuidePage extends StatelessWidget {
  const GuidePage._();

  static Widget blocProvider(
    GuidePageArguments arguments,
  ) {
    return BlocProvider(
      create: (context) {
        if (arguments is CreateRoutePageArguments) {
          return GuideCubit.createRoute(
            artistRepository: serviceLocator(),
            permissionService: serviceLocator(),
            locationService: serviceLocator(),
            routeRepository: serviceLocator(),
            routeGeneratorRepository: serviceLocator(),
            authRepository: serviceLocator(),
            selectedSpecialityIds: arguments.selectedSpecialityIds,
          );
        }
        return GuideCubit.openRoute(
          artistRepository: serviceLocator(),
          permissionService: serviceLocator(),
          locationService: serviceLocator(),
          routeRepository: serviceLocator(),
          routeGeneratorRepository: serviceLocator(),
          authRepository: serviceLocator(),
        );
      },
      child: BlocListener<GuideCubit, GuideState>(
        listener: (context, state) {
          if (state.completed) {
            context.navigator.pushReplacementNamed(
              CompletedPage.routeName,
            );
          }
        },
        child: const GuidePage._(),
      ),
    );
  }

  static const String routeName = 'route_guide_guide';

  @override
  Widget build(
    BuildContext context,
  ) {
    final cubit = context.blocProvider<GuideCubit>();
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
          builder: (context, state) {
            if (!state.routeLoaded) {
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
                      stops: state.route!.stops,
                      currentStop: state.currentStop!,
                      initialMapLocation: state.initialMapLocation!,
                    ),
                    Expanded(
                      child: Container(
                        decoration: getTopShadowBoxDecoration(context),
                        child: ListView.builder(
                          itemCount: state.route!.stops.length,
                          itemBuilder: (context, index) {
                            final stop = state.route!.stops[index];
                            return RouteListItem(
                              count: state.route!.stops.length,
                              index: index,
                              stop: stop,
                              active: state.currentStop == stop,
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

class CreateRoutePageArguments extends GuidePageArguments {
  const CreateRoutePageArguments({
    required this.selectedSpecialityIds,
  });

  final List<String> selectedSpecialityIds;
}

class OpenRoutePageArguments extends GuidePageArguments {
  const OpenRoutePageArguments();
}
