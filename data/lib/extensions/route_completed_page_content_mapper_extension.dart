import 'package:verbeelding_verbindt_core/entities/page_content/route_completed_page_content.dart';

import '../models/route_completed_page_content.dart';
import 'image_mapper_extensions.dart';
import 'translatable_string_mapper_extensions.dart';

extension RouteCompletedPageContentDataModelExtensions
    on RouteCompletedPageContentDataModel {
  RouteCompletedPageContentEntity toEntity() {
    return RouteCompletedPageContentEntity(
      headerImage: headerImage.toEntity(),
      text: text.toEntity(),
    );
  }
}

extension RouteCompletedPageContentDataModelListExtensions
    on Iterable<RouteCompletedPageContentDataModel> {
  List<RouteCompletedPageContentEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<RouteCompletedPageContentEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension RouteCompletedPageContentEntityExtensions
    on RouteCompletedPageContentEntity {
  RouteCompletedPageContentDataModel toDataModel() {
    return RouteCompletedPageContentDataModel(
      headerImage: headerImage.toDataModel(),
      text: text.toDataModel(),
    );
  }
}

extension RouteCompletedPageContentEntityListExtensions
    on Iterable<RouteCompletedPageContentEntity> {
  List<RouteCompletedPageContentDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<RouteCompletedPageContentDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
