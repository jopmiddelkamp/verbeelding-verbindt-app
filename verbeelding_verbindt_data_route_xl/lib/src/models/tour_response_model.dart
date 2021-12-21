import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../verbeelding_verbindt_data_route_xl.dart';

part 'tour_response_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class TourResponseModel extends Equatable {
  const TourResponseModel({
    required this.id,
    required this.count,
    required this.feasible,
    required this.route,
  });

  final String id;
  final int count;
  final bool feasible;
  final Map<String, RouteStepModel> route;

  @override
  String toString() => '''$runtimeType { 
                            id: $id, 
                            count: $count, 
                            feasible: $feasible, 
                            routeCount: ${route.length} 
                          }''';

  @override
  List<Object?> get props => [
        id,
        count,
        feasible,
        route,
      ];

  // ignore: sort_constructors_first
  factory TourResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TourResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$TourResponseModelToJson(this);
}
