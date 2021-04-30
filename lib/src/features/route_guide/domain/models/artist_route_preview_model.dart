import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/domain/models/image_model.dart';

part 'artist_route_preview_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class ArtistRoutePreviewModel extends Equatable {
  const ArtistRoutePreviewModel({
    required this.text,
    required this.images,
  });

  final String text;
  final List<ImageModel> images;

  @override
  List<Object?> get props => [
        text,
        images.hashCode,
      ];

  @override
  String toString() => '''$runtimeType { 
                            text: $text,
                            images: $images,
                          }''';

  static ArtistRoutePreviewModel fromJson(Map<String, dynamic> json) =>
      _$ArtistRoutePreviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistRoutePreviewModelToJson(this);
}
