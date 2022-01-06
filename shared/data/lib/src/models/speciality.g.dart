// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speciality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialityDataModel _$SpecialityDataModelFromJson(Map<String, dynamic> json) =>
    SpecialityDataModel(
      id: json['id'] as String?,
      name: const TranslatableStringDataModelJsonConverter()
          .fromJson(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpecialityDataModelToJson(
        SpecialityDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': const TranslatableStringDataModelJsonConverter()
          .toJson(instance.name),
    };
