import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data.dart';

extension SizeDataModelX on SizeDataModel {
  Size toEntity() {
    return Size(
      width,
      height,
    );
  }
}

extension SizeDataModelListX on Iterable<SizeDataModel> {
  List<Size> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<Size> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension SizeX on Size {
  SizeDataModel toDataModel() {
    return SizeDataModel(
      width,
      height,
    );
  }
}

extension SizeListX on Iterable<Size> {
  List<SizeDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<SizeDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
