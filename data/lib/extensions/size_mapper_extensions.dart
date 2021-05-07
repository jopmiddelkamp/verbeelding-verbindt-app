import 'package:verbeelding_verbindt_core/entities/common/size.dart';

import '../models/size.dart';

extension SizeDataModelExtensions on SizeDataModel {
  SizeEntity toEntity() {
    return SizeEntity(
      width,
      height,
    );
  }
}

extension SizeDataModelListExtensions on Iterable<SizeDataModel> {
  List<SizeEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<SizeEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension SizeEntityExtensions on SizeEntity {
  SizeDataModel toDataModel() {
    return SizeDataModel(
      width,
      height,
    );
  }
}

extension SizeEntityListExtensions on Iterable<SizeEntity> {
  List<SizeDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<SizeDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
