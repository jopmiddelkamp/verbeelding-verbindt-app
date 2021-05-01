import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../shared/domain/services/location/location_service.dart';
import '../../../../../shared/domain/services/permission/permission_service.dart';
import '../../../../../shared/presentation/widgets/loading_indicators/circle_loading_indicator.dart';
import '../../../../../theme.dart';
import '../../../domain/services/artist_service.dart';
import '../../../domain/services/route_service.dart';
import 'bloc/barrel.dart';
import 'widgets/route_list_item.dart';
import 'widgets/route_map.dart';

final sl = GetIt.instance;

class RoutePage extends StatelessWidget {
  const RoutePage._();

  static Widget blocProvider(
    RoutePageArguments arguments,
  ) {
    return BlocProvider(
      create: (context) {
        if (arguments is CreateRoutePageArguments) {
          return PageBloc.createRoute(
            artistService: sl<ArtistService>(),
            permissionService: sl<PermissionService>(),
            locationService: sl<LocationService>(),
            routeService: sl<RouteService>(),
            selectedSpecialityIds: arguments.selectedSpecialityIds,
          );
        }
        return PageBloc.openRoute(
          artistService: sl<ArtistService>(),
          permissionService: sl<PermissionService>(),
          locationService: sl<LocationService>(),
          routeService: sl<RouteService>(),
        );
      },
      child: const RoutePage._(),
    );
  }

  static MaterialPageRoute route(
    RoutePageArguments arguments,
  ) {
    return MaterialPageRoute(
      builder: (context) => RoutePage.blocProvider(
        arguments,
      ),
    );
  }

  static const String routeName = '/route';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route'),
      ),
      body: BlocBuilder<PageBloc, PageState>(
        builder: (context, state) {
          if (!state.stopsLoaded) {
            return const VVCircleLoadingIndicator();
          }
          return LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  RouteMap(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight / 3,
                    stops: state.stops!,
                    currentStop: state.currentStop!,
                    initialMapLocation: state.initialMapLocation!,
                  ),
                  Expanded(
                    child: Container(
                      decoration: getTopShadowBoxDecoration(context),
                      child: ListView.builder(
                        itemCount: state.stops!.length,
                        itemBuilder: (context, index) {
                          final stop = state.stops![index];
                          return RouteListItem(
                            count: state.stops!.length,
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
    );
  }
}

abstract class RoutePageArguments {
  const RoutePageArguments();
}

class CreateRoutePageArguments extends RoutePageArguments {
  const CreateRoutePageArguments({
    required this.selectedSpecialityIds,
  });

  final List<String> selectedSpecialityIds;
}

class OpenExistingRoutePageArguments extends RoutePageArguments {
  const OpenExistingRoutePageArguments();
}
