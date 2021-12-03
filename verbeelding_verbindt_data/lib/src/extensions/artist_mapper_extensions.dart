import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data.dart';

extension ArtistDataModelExtensions on ArtistDataModel {
  ArtistEntity toEntity() {
    return ArtistEntity(
      id: id,
      profile: profile.toEntity(),
      specialities: specialities.map((k, v) => MapEntry(k, v.toEntity())),
      location: location.toEntity(),
      previewContent: previewContent.toEntity(),
      detailsContent: detailsContent.toEntity(),
      website: website,
    );
  }
}

extension ArtistDataModelListExtensions on Iterable<ArtistDataModel> {
  List<ArtistEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<ArtistEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension ArtistEntityExtensions on ArtistEntity {
  ArtistDataModel toDataModel() {
    return ArtistDataModel(
      id: id,
      profile: profile.toDataModel(),
      specialities: specialities.map((k, v) => MapEntry(k, v.toDataModel())),
      location: location.toDataModel(),
      previewContent: previewContent.toDataModel(),
      detailsContent: detailsContent.toDataModel(),
      website: website,
    );
  }
}

extension ArtistEntityListExtensions on Iterable<ArtistEntity> {
  List<ArtistDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ArtistDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
