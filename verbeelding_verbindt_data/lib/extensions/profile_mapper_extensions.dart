import 'package:verbeelding_verbindt_core/entities/profile.dart';

import '../models/profile.dart';

extension ProfileModelExtensions on ProfileDataModel {
  ProfileEntity toEntity() {
    return ProfileEntity(
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      personalImage: personalImage,
    );
  }
}

extension ProfileModelListExtensions on Iterable<ProfileDataModel> {
  List<ProfileEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<ProfileEntity> toEntitySet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension ProfileEntityExtensions on ProfileEntity {
  ProfileDataModel toDataModel() {
    return ProfileDataModel(
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      personalImage: personalImage,
    );
  }
}

extension ProfileEntityListExtensions on Iterable<ProfileEntity> {
  List<ProfileDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ProfileDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
