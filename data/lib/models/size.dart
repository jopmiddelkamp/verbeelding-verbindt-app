import 'package:json_annotation/json_annotation.dart';

part 'size.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class SizeDataModel {
  const SizeDataModel(
    this.width,
    this.height,
  );
  final double width;
  final double height;

  static SizeDataModel fromJson(Map<String, dynamic> json) =>
      _$SizeDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$SizeDataModelToJson(this);
}
