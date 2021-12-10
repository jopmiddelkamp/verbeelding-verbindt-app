import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_dio.dart';

extension ArtistDataModelExtensions on ArtistDataModel {
  ArtistGeoLocation toGeoLocation() {
    return ArtistGeoLocation(
      id: id,
      profile: profile.toGeoLocation(),
      specialities: specialities.map((k, v) => MapEntry(k, v.toGeoLocation())),
      location: location.toGeoLocation(),
      previewContent: previewContent.toGeoLocation(),
      detailsContent: detailsContent.toGeoLocation(),
      website: website,
    );
  }
}

extension ArtistDataModelListExtensions on Iterable<ArtistDataModel> {
  List<ArtistGeoLocation> toGeoLocationList() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<ArtistGeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension ArtistGeoLocationExtensions on ArtistGeoLocation {
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

extension ArtistGeoLocationListExtensions on Iterable<ArtistGeoLocation> {
  List<ArtistDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ArtistDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
