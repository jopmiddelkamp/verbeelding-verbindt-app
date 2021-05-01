import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../shared/domain/failures/failure.dart';
import '../../../../../../shared/domain/models/location_model.dart';
import '../../../../domain/models/route_stop_model.dart';

class GuideState {
  const GuideState._({
    required this.stops,
    required this.currentStop,
    required this.initialMapLocation,
    required this.mapController,
    required this.failure,
  });

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
    required List<RouteStopModel> stops,
    required LocationModel initialMapLocation,
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

  final List<RouteStopModel>? stops;
  final RouteStopModel? currentStop;
  final LocationModel? initialMapLocation;
  final GoogleMapController? mapController;
  final Failure? failure;

  bool get stopsLoaded => stops != null && currentStop != null;
  bool get hasStops => stopsLoaded && stops!.isNotEmpty;
  bool get mapLoaded => mapController != null;
  bool get hasFailure => failure == null;

  static RouteStopModel _getCurrentStop(
    List<RouteStopModel> stops,
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
    List<RouteStopModel>? stops,
    LocationModel? initialMapLocation,
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
