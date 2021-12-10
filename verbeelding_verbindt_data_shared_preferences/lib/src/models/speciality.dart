import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data_shared_preferences.dart';

part 'speciality.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class SpecialityDataModel extends Equatable {
  const SpecialityDataModel({
    required this.id,
    required this.name,
  });

  final String? id;
  final TranslatableStringDataModel name;

  @override
  List<Object?> get props => [id, name];

  SpecialityDataModel copyWith({
    String? name,
  }) {
    return SpecialityDataModel(
      id: id,
      name: name as TranslatableStringDataModel? ?? this.name,
    );
  }

  @override
  String toString() => 'Speciality { id: $id, name: $name }';

  static SpecialityDataModel fromFirebaseMap(
    String id,
    Map<String, dynamic> map,
  ) =>
      SpecialityDataModel(
        id: id,
        name: TranslatableStringDataModel.fromFirebaseMap(map['name']),
      );

  static SpecialityDataModel fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SpecialityDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialityDataModelToJson(this);
}
