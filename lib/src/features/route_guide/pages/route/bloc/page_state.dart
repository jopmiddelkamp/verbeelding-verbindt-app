import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../common/failures/failure.dart';
import '../../../../../common/models/location_model.dart';
import '../../../models/route_stop_model.dart';

class PageState {
  const PageState._({
    required this.stops,
    required this.currentStop,
    required this.initialMapLocation,
    required this.mapController,
    required this.failure,
  });

  factory PageState.initialize() {
    return PageState._(
      stops: null,
      currentStop: null,
      initialMapLocation: null,
      mapController: null,
      failure: null,
    );
  }

  factory PageState.load({
    required List<RouteStopModel> stops,
    required LocationModel initialMapLocation,
    GoogleMapController? mapController,
  }) {
    final currentStop = _getCurrentStop(stops);
    return PageState._(
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

  PageState copyWith({
    List<RouteStopModel>? stops,
    LocationModel? initialMapLocation,
    GoogleMapController? mapController,
    Failure? failure,
  }) {
    final updatedStops = stops ?? this.stops;
    return PageState._(
      stops: updatedStops,
      currentStop: updatedStops != null ? _getCurrentStop(updatedStops) : null,
      initialMapLocation: initialMapLocation ?? this.initialMapLocation,
      mapController: mapController ?? this.mapController,
      failure: failure ?? this.failure,
    );
  }
}
