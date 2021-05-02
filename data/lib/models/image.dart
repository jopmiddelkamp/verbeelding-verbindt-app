import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class ImageDataModel extends Equatable {
  const ImageDataModel({
    required this.blurhash,
    required this.url,
  });

  factory ImageDataModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return ImageDataModel(
      blurhash: map['blurhash'],
      url: map['url'],
    );
  }

  final String blurhash;
  final String url;

  @override
  String toString() => '$runtimeType { blurhash: $blurhash, url: $url }';

  @override
  List<Object> get props => [blurhash, url];

  static ImageDataModel fromJson(Map<String, dynamic> json) =>
      _$ImageDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDataModelToJson(this);
}
