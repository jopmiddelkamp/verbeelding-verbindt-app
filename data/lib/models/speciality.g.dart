// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speciality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialityDataModel _$SpecialityDataModelFromJson(Map<String, dynamic> json) {
  return SpecialityDataModel(
    id: json['id'] as String?,
    name: TranslatableStringDataModel.fromJson(
        json['name'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SpecialityDataModelToJson(
        SpecialityDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name.toJson(),
    };
