import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'rx_location_model.dart';

part 'rx_tour_request_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class RxTourRequestModel extends Equatable {
  const RxTourRequestModel({
    required this.locations,
  });

  final List<RxLocationModel> locations;

  @override
  String toString() => '$runtimeType { locationsCount: ${locations.length} }';

  @override
  List<Object> get props => [
        locations,
      ];

  // ignore: sort_constructors_first
  factory RxTourRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RxTourRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RxTourRequestModelToJson(this);
}
