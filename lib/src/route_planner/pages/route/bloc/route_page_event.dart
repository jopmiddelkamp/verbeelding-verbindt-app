import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/artist_model.dart';
import '../../../models/route_stop_model.dart';

abstract class RoutePageEvent extends Equatable {
  const RoutePageEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => '$runtimeType {}';
}

class RouteOpenRoute extends RoutePageEvent {
  const RouteOpenRoute({
    required this.initialMapLatLng,
  });

  final LatLng initialMapLatLng;
}

class RouteLoadRoute extends RoutePageEvent {
  const RouteLoadRoute({
    required this.stops,
    required this.currentStop,
    required this.initialMapLatLng,
  });

  final List<RouteStopModel> stops;
  final RouteStopModel currentStop;
  final LatLng initialMapLatLng;
}

class RouteUpdateRoute extends RoutePageEvent {
  const RouteUpdateRoute({
    required this.stops,
    required this.currentStop,
  });

  final List<RouteStopModel> stops;
  final RouteStopModel currentStop;
}

class RouteCreateRoute extends RoutePageEvent {
  const RouteCreateRoute({
    required this.artists,
    required this.startingArtistId,
  });

  final List<ArtistModel> artists;
  final String startingArtistId;

  ArtistModel get startingArtist {
    return artists.firstWhere((e) => e.id == startingArtistId);
  }

  @override
  String toString() => '''$runtimeType { 
                            artistsCount: ${artists.length}, 
                            startingArtistId: $startingArtistId 
                          }''';
}

class QrScanned extends RoutePageEvent {
  const QrScanned(
    this.value,
  );

  final String value;

  @override
  String toString() => '$runtimeType { value: $value }';
}

class MapControllerCreated extends RoutePageEvent {
  const MapControllerCreated(
    this.controller,
  );

  final GoogleMapController controller;

  @override
  String toString() => '$runtimeType { controller: $controller }';
}

class RouteCompleteRoute extends RoutePageEvent {
  const RouteCompleteRoute({
    required this.stops,
  });

  final List<RouteStopModel> stops;
}
