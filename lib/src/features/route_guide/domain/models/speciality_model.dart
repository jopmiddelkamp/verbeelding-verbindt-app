import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/domain/models/translatable_string_model.dart';

part 'speciality_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class SpecialityModel extends Equatable {
  const SpecialityModel({
    required this.id,
    required this.name,
  });

  final String? id;
  final TranslatableStringModel name;

  @override
  List<Object?> get props => [id, name];

  SpecialityModel copyWith({
    String? name,
  }) {
    return SpecialityModel(
      id: id,
      name: name as TranslatableStringModel? ?? this.name,
    );
  }

  @override
  String toString() => 'Speciality { id: $id, name: $name }';

  static SpecialityModel fromMap(
    String id,
    Map<String, dynamic> map,
  ) =>
      SpecialityModel(
        id: id,
        name: TranslatableStringModel.fromMap(map['name']),
      );

  static SpecialityModel fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SpecialityModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialityModelToJson(this);
}
