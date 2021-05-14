import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:verbeelding_verbindt_core/entities/common/location.dart';
import 'package:verbeelding_verbindt_core/entities/common/route.dart';
import 'package:verbeelding_verbindt_core/entities/common/route_stop.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

import '../../../../shared/bloc/state_base.dart';

class GuideState extends StateBase {
  GuideState._({
    required this.route,
    required this.currentStop,
    required this.currentStopIndex,
    required this.initialMapLocation,
    required this.mapController,
    Failure? failure,
  }) : super(
          failure: failure,
        );

  factory GuideState.initialize() {
    return GuideState._(
      route: null,
      currentStop: null,
      currentStopIndex: null,
      initialMapLocation: null,
      mapController: null,
      failure: null,
    );
  }

  factory GuideState.load({
    required RouteEntity route,
    required LocationEntity initialMapLocation,
    GoogleMapController? mapController,
  }) {
    final currentIndex = _getCurrentIndex(route.stops);
    final currentStop = currentIndex != null ? route.stops[currentIndex] : null;
    return GuideState._(
      route: route,
      currentStop: currentStop,
      currentStopIndex: currentIndex,
      initialMapLocation: initialMapLocation,
      mapController: mapController,
      failure: null,
    );
  }

  final RouteEntity? route;
  final RouteStopEntity? currentStop;
  final int? currentStopIndex;
  final LocationEntity? initialMapLocation;
  final GoogleMapController? mapController;

  bool get routeLoaded => route != null;
  bool get hasStops => routeLoaded && route!.stops.isNotEmpty;
  bool get hasCurrentStop => routeLoaded && currentStop != null;
  bool get mapLoaded => mapController != null;
  bool get completed => route?.stops.every((stop) => stop.completed) ?? false;

  static int? _getCurrentIndex(
    List<RouteStopEntity> stops,
  ) {
    for (var i = 0; i < stops.length; i++) {
      if (!stops[i].completed) return i;
    }
  }

  @override
  String toString() => '''$runtimeType { 
                            route: $route, 
                            currentStop: $currentStop, 
                            currentStopIndex: $currentStopIndex, 
                            initialMapLocation: $initialMapLocation, 
                            mapController: $mapController,
                            failure: $failure
                          }''';

  GuideState copyWith({
    RouteEntity? route,
    LocationEntity? initialMapLocation,
    GoogleMapController? mapController,
    Failure? failure,
  }) {
    int? currentStopIndex;
    RouteStopEntity? currentStop;
    if (route != null) {
      currentStopIndex = _getCurrentIndex(route.stops);
      final hasCurrentStop = currentStopIndex != null;
      currentStop = hasCurrentStop ? route.stops[currentStopIndex!] : null;
    }
    return GuideState._(
      route: route ?? this.route,
      currentStop: currentStop ?? this.currentStop,
      currentStopIndex: currentStopIndex ?? this.currentStopIndex,
      initialMapLocation: initialMapLocation ?? this.initialMapLocation,
      mapController: mapController ?? this.mapController,
      failure: failure ?? this.failure,
    );
  }
}
