import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class RouteEntity extends Equatable {
  const RouteEntity({
    required this.id,
    required this.stops,
  });

  final String? id;
  final List<RouteStopEntity> stops;

  RouteStopEntity get currentStop => stops.firstWhere(
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

  RouteEntity copyWith({
    List<RouteStopEntity>? stops,
  }) {
    return RouteEntity(
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
