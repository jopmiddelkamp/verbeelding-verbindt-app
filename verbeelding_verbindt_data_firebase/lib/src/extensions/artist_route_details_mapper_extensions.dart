import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

extension ArtistRouteDetailsModelExtensions on ArtistRouteDetailsDataModel {
  ArtistRouteDetailsGeoLocation toGeoLocation() {
    return ArtistRouteDetailsGeoLocation(
      video: video.toGeoLocation(),
      text: text.toGeoLocation(),
      images: images.map((e) => e.toGeoLocation()).toList(),
    );
  }
}

extension ArtistRouteDetailsModelListExtensions
    on Iterable<ArtistRouteDetailsDataModel> {
  List<ArtistRouteDetailsGeoLocation> toGeoLocationlist() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<ArtistRouteDetailsGeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension ArtistRouteDetailsGeoLocationExtensions
    on ArtistRouteDetailsGeoLocation {
  ArtistRouteDetailsDataModel toDataModel() {
    return ArtistRouteDetailsDataModel(
      video: video.toDataModel(),
      text: text.toDataModel(),
      images: images.map((e) => e.toDataModel()).toList(),
    );
  }
}

extension ArtistRouteDetailsGeoLocationListExtensions
    on Iterable<ArtistRouteDetailsGeoLocation> {
  List<ArtistRouteDetailsDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ArtistRouteDetailsDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
