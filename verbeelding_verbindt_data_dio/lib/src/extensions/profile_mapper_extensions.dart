import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../../verbeelding_verbindt_data_dio.dart';

extension ProfileModelExtensions on ProfileDataModel {
  ProfileGeoLocation toGeoLocation() {
    return ProfileGeoLocation(
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      personalImage: personalImage,
    );
  }
}

extension ProfileModelListExtensions on Iterable<ProfileDataModel> {
  List<ProfileGeoLocation> toGeoLocationList() {
    return map((e) => e.toGeoLocation()).toList();
  }

  Set<ProfileGeoLocation> toGeoLocationSet() {
    return map((e) => e.toGeoLocation()).toSet();
  }
}

extension ProfileGeoLocationExtensions on ProfileGeoLocation {
  ProfileDataModel toDataModel() {
    return ProfileDataModel(
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      personalImage: personalImage,
    );
  }
}

extension ProfileGeoLocationListExtensions on Iterable<ProfileGeoLocation> {
  List<ProfileDataModel> toDataModelList() {
    return map((e) => e.toDataModel()).toList();
  }

  Set<ProfileDataModel> toDataModelSet() {
    return map((e) => e.toDataModel()).toSet();
  }
}
