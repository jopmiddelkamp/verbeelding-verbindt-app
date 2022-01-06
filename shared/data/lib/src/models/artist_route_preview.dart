import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data.dart';

part 'artist_route_preview.g.dart';

@JsonSerializable()
class ArtistRoutePreviewDataModel extends Equatable {
  const ArtistRoutePreviewDataModel({
    required this.text,
  });

  @TranslatableStringDataModelJsonConverter()
  final TranslatableStringDataModel text;

  @override
  List<Object?> get props => [
        text,
      ];

  @override
  bool? get stringify => true;

  static ArtistRoutePreviewDataModel fromJson(Map<String, dynamic> json) =>
      _$ArtistRoutePreviewDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistRoutePreviewDataModelToJson(this);
}
