import 'package:verbeelding_verbindt_core/entities/youtube_video.dart';

import '../models/youtube_video.dart';

extension YoutubeVideoDataModelExtensions on YoutubeVideoDataModel {
  YoutubeVideoEntity toEntity() {
    return YoutubeVideoEntity(
      aspectRatio: aspectRatio,
      videoId: videoId,
    );
  }
}

extension VideoModelListExtensions on Iterable<YoutubeVideoDataModel> {
  List<YoutubeVideoEntity> toEntitylist() {
    return map((e) => e.toEntity()).toList();
  }

  Set<YoutubeVideoEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension YoutubeVideoEntityExtensions on YoutubeVideoEntity {
  YoutubeVideoDataModel toDataModel() {
    return YoutubeVideoDataModel(
      aspectRatio: aspectRatio,
      videoId: videoId,
    );
  }
}

extension YoutubeVideoEntityListExtensions on Iterable<YoutubeVideoEntity> {
  List<YoutubeVideoDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<YoutubeVideoDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
