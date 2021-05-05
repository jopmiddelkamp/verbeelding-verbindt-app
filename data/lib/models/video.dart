import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class VideoDataModel {
  const VideoDataModel({
    required this.aspectRatio,
    required this.url,
  });
  final double aspectRatio;
  final String url;

  @override
  String toString() => '''$runtimeType { 
                            aspectRatio: $aspectRatio,
                            url: $url,
                          }''';

  static VideoDataModel fromJson(Map<String, dynamic> json) =>
      _$VideoDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$VideoDataModelToJson(this);
}
