import 'package:verbeelding_verbindt_core/entities/image.dart';

import '../models/image.dart';

extension ImageModelExtensions on ImageDataModel {
  ImageEntity toEntity() {
    return ImageEntity(
      blurhash: blurhash,
      url: url,
    );
  }
}

extension ImageModelListExtensions on Iterable<ImageDataModel> {
  List<ImageEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<ImageEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension ImageEntityExtensions on ImageEntity {
  ImageDataModel toDataModel() {
    return ImageDataModel(
      blurhash: blurhash,
      url: url,
    );
  }
}

extension ImageEntityListExtensions on Iterable<ImageEntity> {
  List<ImageDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ImageDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
