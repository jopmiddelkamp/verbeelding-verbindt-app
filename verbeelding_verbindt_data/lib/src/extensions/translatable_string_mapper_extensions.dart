import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data.dart';

extension TranslatableStringModelExtensions on TranslatableStringDataModel {
  TranslatableStringEntity toEntity() {
    return TranslatableStringEntity(data);
  }
}

extension TranslatableStringModelListExtensions
    on Iterable<TranslatableStringDataModel> {
  List<TranslatableStringEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<TranslatableStringEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension TranslatableStringEntityExtensions on TranslatableStringEntity {
  TranslatableStringDataModel toDataModel() {
    return TranslatableStringDataModel(data);
  }
}

extension TranslatableStringEntityListExtensions
    on Iterable<TranslatableStringEntity> {
  List<TranslatableStringDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<TranslatableStringDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
