import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class ImageModel extends Equatable {
  const ImageModel({
    required this.blurhash,
    required this.url,
  });

  factory ImageModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return ImageModel(
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

  static ImageModel fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
