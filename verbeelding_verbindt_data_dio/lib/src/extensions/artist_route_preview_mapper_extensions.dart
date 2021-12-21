import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_dio.dart';

extension ArtistRoutePreviewModelX on ArtistRoutePreviewDataModel {
  ArtistRoutePreview toEntity() {
    return ArtistRoutePreview(
      text: text.toEntity(),
    );
  }
}

extension ArtistRoutePreviewModelListExtensions
    on Iterable<ArtistRoutePreviewDataModel> {
  List<ArtistRoutePreview> tolist() {
    return map((e) => e.toEntity()).toList();
  }

  Set<ArtistRoutePreview> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension ArtistRoutePreviewX on ArtistRoutePreview {
  ArtistRoutePreviewDataModel toDataModel() {
    return ArtistRoutePreviewDataModel(
      text: text.toDataModel(),
    );
  }
}

extension ArtistRoutePreviewListX on Iterable<ArtistRoutePreview> {
  List<ArtistRoutePreviewDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ArtistRoutePreviewDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
