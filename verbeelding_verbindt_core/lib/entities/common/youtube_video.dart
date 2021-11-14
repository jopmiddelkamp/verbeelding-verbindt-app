import 'package:equatable/equatable.dart';

class YoutubeVideoEntity extends Equatable {
  const YoutubeVideoEntity({
    required this.aspectRatio,
    required this.videoId,
  });

  final double aspectRatio;
  final String videoId;

  @override
  List<Object?> get props => [
        aspectRatio,
        videoId,
      ];
}
