import 'package:verbeelding_verbindt_core/entities/artist_route_preview.dart';

import '../models/artist_route_preview.dart';
import 'image_mapper_extension.dart';
import 'translatable_string_mapper_extensions.dart';

extension ArtistRoutePreviewModelExtensions on ArtistRoutePreviewDataModel {
  ArtistRoutePreviewEntity toEntity() {
    return ArtistRoutePreviewEntity(
      text: text.toEntity(),
      images: images.map((e) => e.toEntity()).toList(),
    );
  }
}

extension ArtistRoutePreviewModelListExtensions
    on Iterable<ArtistRoutePreviewDataModel> {
  List<ArtistRoutePreviewEntity> toEntitylist() {
    return map((e) => e.toEntity()).toList();
  }

  Set<ArtistRoutePreviewEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension ArtistRoutePreviewEntityExtensions on ArtistRoutePreviewEntity {
  ArtistRoutePreviewDataModel toDataModel() {
    return ArtistRoutePreviewDataModel(
      text: text.toDataModel(),
      images: images.map((e) => e.toDataModel()).toList(),
    );
  }
}

extension ArtistRoutePreviewEntityListExtensions
    on Iterable<ArtistRoutePreviewEntity> {
  List<ArtistRoutePreviewDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ArtistRoutePreviewDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
