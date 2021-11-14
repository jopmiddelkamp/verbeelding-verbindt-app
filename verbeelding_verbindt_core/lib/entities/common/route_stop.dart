import 'package:equatable/equatable.dart';

import 'artist.dart';

class RouteStopEntity extends Equatable {
  const RouteStopEntity({
    required this.artist,
    this.completed = false,
  });

  final ArtistEntity artist;
  final bool completed;

  bool get notCompleted => !completed;

  RouteStopEntity copyWith({
    ArtistEntity? artist,
    bool? completed,
  }) {
    return RouteStopEntity(
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
