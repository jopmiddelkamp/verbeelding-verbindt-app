import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data.dart';

part 'route_stop.g.dart';

@JsonSerializable()
class RouteStopDataModel extends Equatable {
  const RouteStopDataModel({
    required this.artist,
    this.completed = false,
  });

  final ArtistDataModel artist;
  final bool completed;

  @override
  List<Object?> get props => [artist, completed];

  @override
  bool? get stringify => true;

  RouteStopDataModel copyWith({
    ArtistDataModel? artist,
    bool? completed,
  }) {
    return RouteStopDataModel(
      artist: artist ?? this.artist,
      completed: completed ?? this.completed,
    );
  }

  static RouteStopDataModel fromJson(Map<String, dynamic> json) =>
      _$RouteStopDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$RouteStopDataModelToJson(this);
}
