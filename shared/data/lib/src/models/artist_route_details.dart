import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data.dart';

part 'artist_route_details.g.dart';

@JsonSerializable()
class ArtistRouteDetailsDataModel extends Equatable {
  const ArtistRouteDetailsDataModel({
    required this.video,
    required this.text,
    required this.images,
  });

  final YoutubeVideoDataModel video;
  @TranslatableStringDataModelJsonConverter()
  final TranslatableStringDataModel text;
  final List<ImageDataModel> images;

  @override
  List<Object?> get props => [
        video,
        text,
        images,
      ];

  @override
  bool? get stringify => true;

  static ArtistRouteDetailsDataModel fromJson(Map<String, dynamic> json) =>
      _$ArtistRouteDetailsDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistRouteDetailsDataModelToJson(this);
}
