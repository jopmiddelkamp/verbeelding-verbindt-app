import 'package:json_annotation/json_annotation.dart';

import '../models/image.dart';
import '../models/translatable_string.dart';

part 'artist_route_details.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class ArtistRouteDetailsDataModel {
  const ArtistRouteDetailsDataModel({
    required this.videoUrl,
    required this.text,
    required this.images,
  });

  final String videoUrl;
  final TranslatableStringDataModel text;
  final List<ImageDataModel> images;

  @override
  String toString() => '''$runtimeType { 
                            videoUrl: $videoUrl,
                            text: $text,
                            images: $images,
                          }''';

  static ArtistRouteDetailsDataModel fromJson(Map<String, dynamic> json) =>
      _$ArtistRouteDetailsDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistRouteDetailsDataModelToJson(this);
}
