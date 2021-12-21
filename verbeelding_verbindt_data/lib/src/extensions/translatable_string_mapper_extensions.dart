import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data.dart';

extension TranslatableStringModelX on TranslatableStringDataModel {
  TranslatableString toEntity() {
    return TranslatableString(data);
  }
}

extension TranslatableStringModelListExtensions
    on Iterable<TranslatableStringDataModel> {
  List<TranslatableString> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<TranslatableString> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension TranslatableStringX on TranslatableString {
  TranslatableStringDataModel toDataModel() {
    return TranslatableStringDataModel(data);
  }
}

extension TranslatableStringListX on Iterable<TranslatableString> {
  List<TranslatableStringDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<TranslatableStringDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
