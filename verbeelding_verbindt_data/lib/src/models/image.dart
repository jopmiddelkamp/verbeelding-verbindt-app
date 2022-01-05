import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data.dart';

part 'image.g.dart';

@JsonSerializable()
class ImageDataModel extends Equatable {
  const ImageDataModel({
    required this.blurhash,
    required this.url,
    required this.size,
  });

  final String blurhash;
  final String url;
  final SizeDataModel size;

  @override
  List<Object?> get props => [blurhash, url, size];

  @override
  bool? get stringify => true;

  static ImageDataModel fromJson(Map<String, dynamic> json) =>
      _$ImageDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDataModelToJson(this);
}
