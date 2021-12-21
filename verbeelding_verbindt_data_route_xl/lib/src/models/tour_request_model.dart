import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../verbeelding_verbindt_data_route_xl.dart';

part 'tour_request_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class TourRequestModel extends Equatable {
  const TourRequestModel({
    required this.locations,
  });

  final List<LocationModel> locations;

  @override
  String toString() => '$runtimeType { locationsCount: ${locations.length} }';

  @override
  List<Object?> get props => [
        locations,
      ];

  // ignore: sort_constructors_first
  factory TourRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TourRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$TourRequestModelToJson(this);
}
