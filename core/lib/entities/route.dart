import 'route_stop.dart';

class RouteEntity {
  const RouteEntity({
    required this.id,
    required this.stops,
  });

  final String? id;
  final List<RouteStopEntity> stops;

  List<String?> get artistIds =>
      stops.map((e) => e.artist.id).toList(growable: false);

  List<String> get specialityIds => stops
      .expand((e) => e.artist.specialities.keys)
      .toSet()
      .toList(growable: false);

  RouteEntity copyWith({
    List<RouteStopEntity>? stops,
  }) {
    return RouteEntity(
      id: id,
      stops: stops ?? this.stops,
    );
  }
}
