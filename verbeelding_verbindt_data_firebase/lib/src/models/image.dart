import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

part 'image.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
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
  String toString() =>
      '$runtimeType { blurhash: $blurhash, url: $url, size: $size }';

  @override
  List<Object?> get props => [
        blurhash,
        url,
        size,
      ];

  static ImageDataModel fromJson(Map<String, dynamic> json) =>
      _$ImageDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDataModelToJson(this);
}
