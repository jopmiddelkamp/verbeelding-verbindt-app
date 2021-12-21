import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data.dart';

extension ArtistDataModelX on ArtistDataModel {
  Artist toEntity() {
    return Artist(
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

extension ArtistDataModelListX on Iterable<ArtistDataModel> {
  List<Artist> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<Artist> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension ArtistX on Artist {
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

extension ArtistListX on Iterable<Artist> {
  List<ArtistDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ArtistDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
