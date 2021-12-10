import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

extension ArtistRoutePreviewModelExtensions on ArtistRoutePreviewDataModel {
  ArtistRoutePreviewGeoLocation toGeoLocation() {
    return ArtistRoutePreviewGeoLocation(
      text: text.toGeoLocation(),
    );
  }
}

extension ArtistRoutePreviewModelListExtensions
    on Iterable<ArtistRoutePreviewDataModel> {
  List<ArtistRoutePreviewGeoLocation> toGeoLocationlist() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<ArtistRoutePreviewGeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension ArtistRoutePreviewGeoLocationExtensions
    on ArtistRoutePreviewGeoLocation {
  ArtistRoutePreviewDataModel toDataModel() {
    return ArtistRoutePreviewDataModel(
      text: text.toDataModel(),
    );
  }
}

extension ArtistRoutePreviewGeoLocationListExtensions
    on Iterable<ArtistRoutePreviewGeoLocation> {
  List<ArtistRoutePreviewDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ArtistRoutePreviewDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
