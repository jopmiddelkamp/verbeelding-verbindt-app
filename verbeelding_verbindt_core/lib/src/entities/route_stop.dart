import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class RouteStop extends Equatable {
  const RouteStop({
    required this.artist,
    this.completed = false,
  });

  final Artist artist;
  final bool completed;

  bool get notCompleted => !completed;

  RouteStop copyWith({
    Artist? artist,
    bool? completed,
  }) {
    return RouteStop(
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
