import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_shared_preferences.dart';

extension YoutubeVideoDataModelX on YoutubeVideoDataModel {
  YoutubeVideo toEntity() {
    return YoutubeVideo(
      aspectRatio: aspectRatio,
      videoId: videoId,
    );
  }
}

extension VideoModelListX on Iterable<YoutubeVideoDataModel> {
  List<YoutubeVideo> tolist() {
    return map((e) => e.toEntity()).toList();
  }

  Set<YoutubeVideo> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension YoutubeVideoX on YoutubeVideo {
  YoutubeVideoDataModel toDataModel() {
    return YoutubeVideoDataModel(
      aspectRatio: aspectRatio,
      videoId: videoId,
    );
  }
}

extension YoutubeVideoListX on Iterable<YoutubeVideo> {
  List<YoutubeVideoDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<YoutubeVideoDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
