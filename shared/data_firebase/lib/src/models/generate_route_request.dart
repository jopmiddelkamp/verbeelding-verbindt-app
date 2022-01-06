import 'package:json_annotation/json_annotation.dart';
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart';

part 'generate_route_request.g.dart';

@JsonSerializable()
class GenerateRouteRequestDataModel {
  const GenerateRouteRequestDataModel({
    required this.artistIds,
    required this.userLocation,
  });

  final Set<String> artistIds;
  final GeolocationDataModel userLocation;

  static GenerateRouteRequestDataModel fromJson(
    Map<String, dynamic> json,
  ) {
    return _$GenerateRouteRequestDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenerateRouteRequestDataModelToJson(this);
  }
}
