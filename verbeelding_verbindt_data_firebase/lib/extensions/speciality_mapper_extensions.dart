import 'package:verbeelding_verbindt_core/entities/common/speciality.dart';

import '../models/speciality.dart';
import 'translatable_string_mapper_extensions.dart';

extension SpecialityModelExtensions on SpecialityDataModel {
  SpecialityEntity toEntity() {
    return SpecialityEntity(
      id: id,
      name: name.toEntity(),
    );
  }
}

extension SpecialityModelListExtensions on Iterable<SpecialityDataModel> {
  List<SpecialityEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<SpecialityEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension SpecialityEntityExtensions on SpecialityEntity {
  SpecialityDataModel toDataModel() {
    return SpecialityDataModel(
      id: id,
      name: name.toDataModel(),
    );
  }
}

extension SpecialityEntityListExtensions on Iterable<SpecialityEntity> {
  List<SpecialityDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<SpecialityDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
