import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data.dart';

part 'artist_route_preview.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class ArtistRoutePreviewDataModel {
  const ArtistRoutePreviewDataModel({
    required this.text,
  });

  final TranslatableStringDataModel text;

  @override
  String toString() => '''$runtimeType { 
                            text: $text,
                          }''';

  static ArtistRoutePreviewDataModel fromJson(Map<String, dynamic> json) =>
      _$ArtistRoutePreviewDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistRoutePreviewDataModelToJson(this);
}
