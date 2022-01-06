import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'youtube_video.g.dart';

@JsonSerializable()
class YoutubeVideoDataModel extends Equatable {
  const YoutubeVideoDataModel({
    required this.aspectRatio,
    required this.videoId,
  });
  final double aspectRatio;
  final String videoId;

  @override
  List<Object?> get props => [aspectRatio, videoId];

  @override
  bool? get stringify => true;

  static YoutubeVideoDataModel fromJson(Map<String, dynamic> json) =>
      _$YoutubeVideoDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$YoutubeVideoDataModelToJson(this);
}
