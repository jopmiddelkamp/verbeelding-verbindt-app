import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'size.g.dart';

@JsonSerializable()
class SizeDataModel extends Equatable {
  const SizeDataModel(
    this.width,
    this.height,
  );
  final double width;
  final double height;

  @override
  List<Object?> get props => [width, height];

  @override
  bool? get stringify => true;

  static SizeDataModel fromJson(Map<String, dynamic> json) =>
      _$SizeDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$SizeDataModelToJson(this);
}
