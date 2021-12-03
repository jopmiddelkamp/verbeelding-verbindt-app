import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data.dart';

extension ArtistRouteDetailsModelExtensions on ArtistRouteDetailsDataModel {
  ArtistRouteDetailsEntity toEntity() {
    return ArtistRouteDetailsEntity(
      video: video.toEntity(),
      text: text.toEntity(),
      images: images.map((e) => e.toEntity()).toList(),
    );
  }
}

extension ArtistRouteDetailsModelListExtensions
    on Iterable<ArtistRouteDetailsDataModel> {
  List<ArtistRouteDetailsEntity> toEntitylist() {
    return map((e) => e.toEntity()).toList();
  }

  Set<ArtistRouteDetailsEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension ArtistRouteDetailsEntityExtensions on ArtistRouteDetailsEntity {
  ArtistRouteDetailsDataModel toDataModel() {
    return ArtistRouteDetailsDataModel(
      video: video.toDataModel(),
      text: text.toDataModel(),
      images: images.map((e) => e.toDataModel()).toList(),
    );
  }
}

extension ArtistRouteDetailsEntityListExtensions
    on Iterable<ArtistRouteDetailsEntity> {
  List<ArtistRouteDetailsDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ArtistRouteDetailsDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
