import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/route_stop_model.dart';

abstract class RoutePageState {
  const RoutePageState() : super();

  @override
  String toString() => '$runtimeType {}';
}

class RouteInitializing extends RoutePageState {}

class RouteUpdated extends RoutePageState {
  const RouteUpdated({
    required this.stops,
    required this.currentStop,
    required this.initialMapLatLng,
    this.mapController,
  });

  final List<RouteStopModel> stops;
  final RouteStopModel currentStop;
  final LatLng initialMapLatLng;
  final GoogleMapController? mapController;

  @override
  String toString() => '''$runtimeType { 
                            stops: ${stops.length}, 
                            currentStop: $currentStop, 
                            initialMapLatLng: $initialMapLatLng, 
                            mapController: $mapController 
                          }''';

  RouteUpdated copyWith({
    List<RouteStopModel>? stops,
    RouteStopModel? currentStop,
    LatLng? initialMapLatLng,
    GoogleMapController? mapController,
  }) {
    return RouteUpdated(
      stops: stops ?? this.stops,
      currentStop: currentStop ?? this.currentStop,
      initialMapLatLng: initialMapLatLng ?? this.initialMapLatLng,
      mapController: mapController ?? this.mapController,
    );
  }
}

class RouteCompleted extends RoutePageState {
  const RouteCompleted({
    required this.stops,
  });

  final List<RouteStopModel> stops;

  @override
  String toString() => '$runtimeType { stops: ${stops.length} }';

  RouteCompleted copyWith({
    List<RouteStopModel>? stops,
  }) {
    return RouteCompleted(
      stops: stops ?? this.stops,
    );
  }
}
