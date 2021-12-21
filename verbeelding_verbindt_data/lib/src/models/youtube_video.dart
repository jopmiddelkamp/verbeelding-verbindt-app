import 'package:json_annotation/json_annotation.dart';

part 'youtube_video.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class YoutubeVideoDataModel {
  const YoutubeVideoDataModel({
    required this.aspectRatio,
    required this.videoId,
  });
  final double aspectRatio;
  final String videoId;

  @override
  String toString() => '''$runtimeType { 
                            aspectRatio: $aspectRatio,
                            videoId: $videoId,
                          }''';

  static YoutubeVideoDataModel fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeVideoDataModelToJson(this);
}
