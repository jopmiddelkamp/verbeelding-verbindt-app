import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data.dart';

part 'speciality.g.dart';

@JsonSerializable()
class SpecialityDataModel extends Equatable {
  const SpecialityDataModel({
    required this.id,
    required this.name,
  });

  final String? id;
  @TranslatableStringDataModelJsonConverter()
  final TranslatableStringDataModel name;

  @override
  List<Object?> get props => [id, name];

  @override
  bool? get stringify => true;

  SpecialityDataModel copyWith({
    String? id,
    TranslatableStringDataModel? name,
  }) {
    return SpecialityDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  static SpecialityDataModel fromJson(
    Map<String, dynamic> json,
  ) =>
      _$SpecialityDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialityDataModelToJson(this);
}
