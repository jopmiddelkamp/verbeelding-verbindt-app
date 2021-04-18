import 'package:json_annotation/json_annotation.dart';

import 'artist_model.dart';

part 'route_stop_model.g.dart';

@JsonSerializable()
class RouteStopModel {
  const RouteStopModel({
    required this.artist,
    this.completed = false,
  });

  final ArtistModel artist;
  final bool completed;

  RouteStopModel copyWith({
    ArtistModel? artist,
    bool? completed,
  }) {
    return RouteStopModel(
      artist: artist ?? this.artist,
      completed: completed ?? this.completed,
    );
  }

  static RouteStopModel fromMap(
    Map<String, dynamic> map,
  ) {
    return RouteStopModel(
      artist: ArtistModel.fromMap(
        id: map['artistId'],
        map: map['artist'],
      ),
      completed: map['completed'],
    );
  }

  static RouteStopModel fromJson(Map<String, dynamic> json) =>
      _$RouteStopModelFromJson(json);
  Map<String, dynamic> toJson() => _$RouteStopModelToJson(this);
}
