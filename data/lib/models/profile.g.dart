// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataModel _$ProfileDataModelFromJson(Map<String, dynamic> json) {
  return ProfileDataModel(
    firstName: json['firstName'] as String,
    middleName: json['middleName'] as String?,
    lastName: json['lastName'] as String,
    personalImage: json['personalImage'] as String?,
  );
}

Map<String, dynamic> _$ProfileDataModelToJson(ProfileDataModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'personalImage': instance.personalImage,
    };
