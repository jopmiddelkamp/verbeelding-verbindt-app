import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

extension ProfileModelX on ProfileDataModel {
  Profile toEntity() {
    return Profile(
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      personalImage: personalImage,
    );
  }
}

extension ProfileModelListX on Iterable<ProfileDataModel> {
  List<Profile> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }

  Set<Profile> toSet() {
    return map((e) => e.toEntity()).toSet();
  }
}

extension ProfileX on Profile {
  ProfileDataModel toDataModel() {
    return ProfileDataModel(
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      personalImage: personalImage,
    );
  }
}

extension ProfileListX on Iterable<Profile> {
  List<ProfileDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ProfileDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
