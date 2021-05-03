import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:verbeelding_verbindt_core/entities/location.dart';
import 'package:verbeelding_verbindt_core/entities/route_stop.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

import '../../../../shared/bloc/state_base.dart';

class GuideState extends StateBase {
  GuideState._({
    required this.stops,
    required this.currentStop,
    required this.initialMapLocation,
    required this.mapController,
    Failure? failure,
  }) : super(
          failure: failure,
        );

  factory GuideState.initialize() {
    return GuideState._(
      stops: null,
      currentStop: null,
      initialMapLocation: null,
      mapController: null,
      failure: null,
    );
  }

  factory GuideState.load({
    required List<RouteStopEntity> stops,
    required LocationEntity initialMapLocation,
    GoogleMapController? mapController,
  }) {
    final currentStop = _getCurrentStop(stops);
    return GuideState._(
      stops: stops,
      currentStop: currentStop,
      initialMapLocation: initialMapLocation,
      mapController: mapController,
      failure: null,
    );
  }

  final List<RouteStopEntity>? stops;
  final RouteStopEntity? currentStop;
  final LocationEntity? initialMapLocation;
  final GoogleMapController? mapController;

  bool get stopsLoaded => stops != null && currentStop != null;
  bool get hasStops => stopsLoaded && stops!.isNotEmpty;
  bool get mapLoaded => mapController != null;

  static RouteStopEntity _getCurrentStop(
    List<RouteStopEntity> stops,
  ) {
    return stops.firstWhere(
      (stop) => !stop.completed,
      orElse: null,
    );
  }

  @override
  String toString() => '''$runtimeType { 
                            stops: ${stops?.length}, 
                            currentStop: $currentStop, 
                            initialMapLocation: $initialMapLocation, 
                            mapController: $mapController,
                            failure: $failure
                          }''';

  GuideState copyWith({
    List<RouteStopEntity>? stops,
    LocationEntity? initialMapLocation,
    GoogleMapController? mapController,
    Failure? failure,
  }) {
    final updatedStops = stops ?? this.stops;
    return GuideState._(
      stops: updatedStops,
      currentStop: updatedStops != null ? _getCurrentStop(updatedStops) : null,
      initialMapLocation: initialMapLocation ?? this.initialMapLocation,
      mapController: mapController ?? this.mapController,
      failure: failure ?? this.failure,
    );
  }
}
