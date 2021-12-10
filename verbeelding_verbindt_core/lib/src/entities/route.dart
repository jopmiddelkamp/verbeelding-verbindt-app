import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class RouteGeoLocation extends Equatable {
  const RouteGeoLocation({
    required this.id,
    required this.stops,
  });

  final String? id;
  final List<RouteStopGeoLocation> stops;

  RouteStopGeoLocation get currentStop => stops.firstWhere(
        (stop) => stop.notCompleted,
        orElse: () => stops.last,
      );

  bool get completed => stops.every((stop) => stop.completed);

  int get currentStopIndex {
    final index = stops.indexWhere(
      (stop) => stop.notCompleted,
    );
    if (index == -1) {
      // Not found
      return stops.length - 1;
    }
    return index;
  }

  List<String?> get artistIds =>
      stops.map((e) => e.artist.id).toList(growable: false);

  List<String> get specialityIds => stops
      .expand((e) => e.artist.specialities.keys)
      .toSet()
      .toList(growable: false);

  RouteGeoLocation copyWith({
    List<RouteStopGeoLocation>? stops,
  }) {
    return RouteGeoLocation(
      id: id,
      stops: stops ?? this.stops,
    );
  }

  @override
  List<Object?> get props => [
        id,
        stops,
      ];
}
