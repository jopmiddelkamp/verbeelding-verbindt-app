import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class RouteStopGeoLocation extends Equatable {
  const RouteStopGeoLocation({
    required this.artist,
    this.completed = false,
  });

  final ArtistGeoLocation artist;
  final bool completed;

  bool get notCompleted => !completed;

  RouteStopGeoLocation copyWith({
    ArtistGeoLocation? artist,
    bool? completed,
  }) {
    return RouteStopGeoLocation(
      artist: artist ?? this.artist,
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object> get props => [
        artist,
        completed,
      ];
}
