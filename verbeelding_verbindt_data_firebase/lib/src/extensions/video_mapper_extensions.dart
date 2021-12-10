import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

extension YoutubeVideoDataModelExtensions on YoutubeVideoDataModel {
  YoutubeVideoGeoLocation toGeoLocation() {
    return YoutubeVideoGeoLocation(
      aspectRatio: aspectRatio,
      videoId: videoId,
    );
  }
}

extension VideoModelListExtensions on Iterable<YoutubeVideoDataModel> {
  List<YoutubeVideoGeoLocation> toGeoLocationlist() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<YoutubeVideoGeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension YoutubeVideoGeoLocationExtensions on YoutubeVideoGeoLocation {
  YoutubeVideoDataModel toDataModel() {
    return YoutubeVideoDataModel(
      aspectRatio: aspectRatio,
      videoId: videoId,
    );
  }
}

extension YoutubeVideoGeoLocationListExtensions
    on Iterable<YoutubeVideoGeoLocation> {
  List<YoutubeVideoDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<YoutubeVideoDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
