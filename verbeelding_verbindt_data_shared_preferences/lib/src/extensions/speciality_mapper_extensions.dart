import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_shared_preferences.dart';

extension SpecialityModelX on SpecialityDataModel {
  Speciality toEntity() {
    return Speciality(
      id: id,
      name: name.toEntity(),
    );
  }
}

extension SpecialityModelListX on Iterable<SpecialityDataModel> {
  List<Speciality> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<Speciality> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension SpecialityX on Speciality {
  SpecialityDataModel toDataModel() {
    return SpecialityDataModel(
      id: id,
      name: name.toDataModel(),
    );
  }
}

extension SpecialityListX on Iterable<Speciality> {
  List<SpecialityDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<SpecialityDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
