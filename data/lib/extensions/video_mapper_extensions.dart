import 'package:verbeelding_verbindt_core/entities/video.dart';

import '../models/video.dart';

extension VideoDataModelExtensions on VideoDataModel {
  VideoEntity toEntity() {
    return VideoEntity(
      aspectRatio: aspectRatio,
      url: url,
    );
  }
}

extension VideoModelListExtensions on Iterable<VideoDataModel> {
  List<VideoEntity> toEntitylist() {
    return map((e) => e.toEntity()).toList();
  }

  Set<VideoEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension VideoEntityExtensions on VideoEntity {
  VideoDataModel toDataModel() {
    return VideoDataModel(
      aspectRatio: aspectRatio,
      url: url,
    );
  }
}

extension VideoEntityListExtensions on Iterable<VideoEntity> {
  List<VideoDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<VideoDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
