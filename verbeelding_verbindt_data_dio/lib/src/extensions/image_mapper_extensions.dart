import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_dio.dart';

extension ImageModelExtensions on ImageDataModel {
  ImageGeoLocation toGeoLocation() {
    return ImageGeoLocation(
      blurhash: blurhash,
      url: url,
      size: size.toGeoLocation(),
    );
  }
}

extension ImageModelListExtensions on Iterable<ImageDataModel> {
  List<ImageGeoLocation> toGeoLocationList() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<ImageGeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension ImageGeoLocationExtensions on ImageGeoLocation {
  ImageDataModel toDataModel() {
    return ImageDataModel(
      blurhash: blurhash,
      url: url,
      size: size.toDataModel(),
    );
  }
}

extension ImageGeoLocationListExtensions on Iterable<ImageGeoLocation> {
  List<ImageDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ImageDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
