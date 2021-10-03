import 'package:verbeelding_verbindt_core/entities/page_content/intro_page_content.dart';

import '../models/intro_page_content.dart';
import 'image_mapper_extensions.dart';
import 'translatable_string_mapper_extensions.dart';

extension IntroPageContentDataModelExtensions on IntroPageContentDataModel {
  IntroPageContentEntity toEntity() {
    return IntroPageContentEntity(
      headerImage: headerImage.toEntity(),
      title: title.toEntity(),
      text: text.toEntity(),
    );
  }
}

extension IntroPageContentDataModelListExtensions
    on Iterable<IntroPageContentDataModel> {
  List<IntroPageContentEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<IntroPageContentEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension IntroPageContentEntityExtensions on IntroPageContentEntity {
  IntroPageContentDataModel toDataModel() {
    return IntroPageContentDataModel(
      headerImage: headerImage.toDataModel(),
      title: title.toDataModel(),
      text: text.toDataModel(),
    );
  }
}

extension IntroPageContentEntityListExtensions
    on Iterable<IntroPageContentEntity> {
  List<IntroPageContentDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<IntroPageContentDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
