import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data.dart';

extension ArtistRouteDetailsModelX on ArtistRouteDetailsDataModel {
  ArtistRouteDetails toEntity() {
    return ArtistRouteDetails(
      video: video.toEntity(),
      text: text.toEntity(),
      images: images.map((e) => e.toEntity()).toList(),
    );
  }
}

extension ArtistRouteDetailsModelListExtensions
    on Iterable<ArtistRouteDetailsDataModel> {
  List<ArtistRouteDetails> tolist() {
    return map((e) => e.toEntity()).toList();
  }

  Set<ArtistRouteDetails> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension ArtistRouteDetailsX on ArtistRouteDetails {
  ArtistRouteDetailsDataModel toDataModel() {
    return ArtistRouteDetailsDataModel(
      video: video.toDataModel(),
      text: text.toDataModel(),
      images: images.map((e) => e.toDataModel()).toList(),
    );
  }
}

extension ArtistRouteDetailsListX on Iterable<ArtistRouteDetails> {
  List<ArtistRouteDetailsDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ArtistRouteDetailsDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
