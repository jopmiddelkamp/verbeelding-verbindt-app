import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

extension ImageModelX on ImageDataModel {
  Image toEntity() {
    return Image(
      blurhash: blurhash,
      url: url,
      size: size.toEntity(),
    );
  }
}

extension ImageModelListX on Iterable<ImageDataModel> {
  List<Image> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<Image> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension ImageX on Image {
  ImageDataModel toDataModel() {
    return ImageDataModel(
      blurhash: blurhash,
      url: url,
      size: size.toDataModel(),
    );
  }
}

extension ImageListX on Iterable<Image> {
  List<ImageDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ImageDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
